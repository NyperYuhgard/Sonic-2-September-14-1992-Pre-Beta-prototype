;===============================================================================
; Objeto 0x3E - Container de animais nas fases que contém chefe
; ->>> 
;===============================================================================
; Offset_0x037D78:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x037DA4(PC, D0), D1
                jsr     Offset_0x037DA4(PC, D1)
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x037D9E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x037D9E:
                jmp     (DeleteObject)                         ; Offset_0x0120D0  
;-------------------------------------------------------------------------------      
Offset_0x037DA4:
                dc.w    Offset_0x037DC4-Offset_0x037DA4
                dc.w    Offset_0x037E12-Offset_0x037DA4
                dc.w    Offset_0x037E4E-Offset_0x037DA4
                dc.w    Offset_0x037EB6-Offset_0x037DA4
                dc.w    Offset_0x037EB6-Offset_0x037DA4
                dc.w    Offset_0x037EB6-Offset_0x037DA4
                dc.w    Offset_0x037F4E-Offset_0x037DA4
                dc.w    Offset_0x037F9E-Offset_0x037DA4    
;-------------------------------------------------------------------------------     
Offset_0x037DB4:
                dc.b    $02, $20, $04, $00
                dc.b    $04, $0C, $05, $01
                dc.b    $06, $10, $04, $03
                dc.b    $08, $10, $03, $05    
;-------------------------------------------------------------------------------    
Offset_0x037DC4:
                move.l  #Egg_Prison_Mappings, Obj_Map(A0) ; Offset_0x037FC8, $0004
                move.w  #$049D, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_3C_To_ModifySpriteAttr_2P          ; Offset_0x038074
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.w  Obj_Y(A0), Obj_Control_Var_04(A0)         ; $000C, $0030
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsl.w   #$02, D0
                lea     Offset_0x037DB4(PC, D0), A1
                move.b  (A1)+, Obj_Routine(A0)                           ; $0024
                move.b  (A1)+, Obj_Width(A0)                             ; $0019
                move.b  (A1)+, Obj_Priority(A0)                          ; $0018
                move.b  (A1)+, Obj_Map_Id(A0)                            ; $001A
                cmpi.w  #$0008, D0
                bne.s   Offset_0x037E10
                move.b  #$06, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$08, Obj_Col_Prop(A0)                           ; $0021
Offset_0x037E10:
                rts  
;-------------------------------------------------------------------------------   
Offset_0x037E12:
                cmpi.b  #$02, ($FFFFF7A7).w
                beq.s   Offset_0x037E30
                move.w  #$002B, D1
                move.w  #$0018, D2
                move.w  #$0018, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                jmp     (SolidObject)                          ; Offset_0x0147F4
Offset_0x037E30:
                tst.b   Obj_Routine_2(A0)                                ; $0025
                beq.s   Offset_0x037E46
                clr.b   Obj_Routine_2(A0)                                ; $0025
                bclr    #$03, ($FFFFB022).w
                bset    #$01, ($FFFFB022).w
Offset_0x037E46:
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
                rts     
;-------------------------------------------------------------------------------   
Offset_0x037E4E:
                move.w  #$0017, D1
                move.w  #$0008, D2
                move.w  #$0008, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                jsr     (SolidObject)                          ; Offset_0x0147F4
                lea     (Egg_Prison_Animate_Data), A1          ; Offset_0x037FC0
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                move.w  Obj_Control_Var_04(A0), Obj_Y(A0)         ; $000C, $0030
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq.s   Offset_0x037EB4
                addq.w  #$08, Obj_Y(A0)                                  ; $000C
                move.b  #$0A, Obj_Routine(A0)                            ; $0024
                move.w  #$003C, Obj_Ani_Time(A0)                         ; $001E
                clr.b   (HUD_Timer_Refresh_Flag).w                   ; $FFFFFE1E
                clr.b   (Boss_Flag).w                                ; $FFFFF7AA
                move.b  #$01, ($FFFFF7CC).w
                move.w  #$0800, ($FFFFF602).w
                clr.b   Obj_Routine_2(A0)                                ; $0025
                bclr    #$03, ($FFFFB022).w
                bset    #$01, ($FFFFB022).w
Offset_0x037EB4:
                rts 
;-------------------------------------------------------------------------------   
Offset_0x037EB6:
                moveq   #$07, D0
                and.b   ($FFFFFE0F).w, D0
                bne.s   Offset_0x037EF4
                jsr     (SingleObjectLoad)                     ; Offset_0x013BAA
                bne.s   Offset_0x037EF4
                move.b  #$27, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                moveq   #$00, D1
                move.b  D0, D1
                lsr.b   #$02, D1
                subi.w  #$0020, D1
                add.w   D1, Obj_X(A1)                                    ; $0008
                lsr.w   #$08, D0
                lsr.b   #$03, D0
                add.w   D0, Obj_Y(A1)                                    ; $000C
Offset_0x037EF4:
                subq.w  #$01, Obj_Ani_Time(A0)                           ; $001E
                beq.s   Offset_0x037EFC
                rts
Offset_0x037EFC:
                move.b  #$02, ($FFFFF7A7).w
                move.b  #$0C, Obj_Routine(A0)                            ; $0024
                move.b  #$06, Obj_Map_Id(A0)                             ; $001A
                move.w  #$0096, Obj_Ani_Time(A0)                         ; $001E
                addi.w  #$0020, Obj_Y(A0)                                ; $000C
                moveq   #$07, D6
                move.w  #$009A, D5
                moveq   #-$1C, D4
Offset_0x037F22:
                jsr     (SingleObjectLoad)                     ; Offset_0x013BAA
                bne.s   Offset_0x037F4C
                move.b  #$28, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                add.w   D4, Obj_X(A1)                                    ; $0008
                addq.w  #$07, D4
                move.w  D5, Obj_Control_Var_0A(A1)                       ; $0036
                subq.w  #$08, D5
                dbra    D6, Offset_0x037F22
Offset_0x037F4C:
                rts     
;-------------------------------------------------------------------------------   
Offset_0x037F4E:
                moveq   #$07, D0
                and.b   ($FFFFFE0F).w, D0
                bne.s   Offset_0x037F8C
                jsr     (SingleObjectLoad)                     ; Offset_0x013BAA
                bne.s   Offset_0x037F8C
                move.b  #$28, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                andi.w  #$001F, D0
                subq.w  #$06, D0
                tst.w   D1
                bpl.s   Offset_0x037F82
                neg.w   D0
Offset_0x037F82:
                add.w   D0, Obj_X(A1)                                    ; $0008
                move.w  #$000C, Obj_Control_Var_0A(A1)                   ; $0036
Offset_0x037F8C:
                subq.w  #$01, Obj_Ani_Time(A0)                           ; $001E
                bne.s   Offset_0x037F9C
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$00B4, Obj_Ani_Time(A0)                         ; $001E
Offset_0x037F9C:
                rts 
;-------------------------------------------------------------------------------   
Offset_0x037F9E:
                moveq   #$3E, D0
                moveq   #$28, D1
                moveq   #$40, D2
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
Offset_0x037FA8:
                cmp.b   (A1), D1
                beq.s   Offset_0x037FBE
                adda.w  D2, A1
                dbra    D0, Offset_0x037FA8
                jsr     (Load_Level_Results)                   ; Offset_0x0146A2
                jmp     (DeleteObject)                         ; Offset_0x0120D0
Offset_0x037FBE:
                rts
;-------------------------------------------------------------------------------
Egg_Prison_Animate_Data:                                       ; Offset_0x037FC0
                dc.w    Offset_0x037FC4-Egg_Prison_Animate_Data
                dc.w    Offset_0x037FC4-Egg_Prison_Animate_Data
Offset_0x037FC4:
                dc.b    $02, $01, $03, $FF  
;-------------------------------------------------------------------------------             
Egg_Prison_Mappings:                                           ; Offset_0x037FC8
                dc.w    Offset_0x037FD6-Egg_Prison_Mappings
                dc.w    Offset_0x038010-Egg_Prison_Mappings
                dc.w    Offset_0x03801A-Egg_Prison_Mappings
                dc.w    Offset_0x03804C-Egg_Prison_Mappings
                dc.w    Offset_0x038056-Egg_Prison_Mappings
                dc.w    Offset_0x038068-Egg_Prison_Mappings
                dc.w    Offset_0x038072-Egg_Prison_Mappings
Offset_0x037FD6:
                dc.w    $0007
                dc.l    $E00C2000, $2000FFF0
                dc.l    $E80D2004, $2002FFE0
                dc.l    $E80D200C, $20060000
                dc.l    $F80E2014, $200AFFE0
                dc.l    $F80E2020, $20100000
                dc.l    $100D202C, $2016FFE0
                dc.l    $100D2034, $201A0000
Offset_0x038010:
                dc.w    $0001
                dc.l    $F809003C, $001EFFF4
Offset_0x03801A:
                dc.w    $0006
                dc.l    $00082042, $2021FFE0
                dc.l    $080C2045, $2022FFE0
                dc.l    $00042049, $20240010
                dc.l    $080C204B, $20250000
                dc.l    $100D202C, $2016FFE0
                dc.l    $100D2034, $201A0000
Offset_0x03804C:
                dc.w    $0001
                dc.l    $F809004F, $0027FFF4
Offset_0x038056:
                dc.w    $0002
                dc.l    $E80E2055, $202AFFF0
                dc.l    $000E2061, $2030FFF0
Offset_0x038068:
                dc.w    $0001
                dc.l    $F007206D, $2036FFF8
Offset_0x038072:
                dc.w    $0000
;===============================================================================
; Objeto 0x3E - Container de animais nas fases que contém chefe
; <<<- 
;===============================================================================