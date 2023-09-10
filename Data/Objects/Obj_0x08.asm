;===============================================================================
; Objeto 0x08 - Poeira do Spindash / freio e Splash de água
; ->>>
;===============================================================================
; Offset_0x018B06:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x018B14(PC, D0), D1
                jmp     Offset_0x018B14(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x018B14:
                dc.w    Offset_0x018B1C-Offset_0x018B14
                dc.w    Offset_0x018B68-Offset_0x018B14
                dc.w    Offset_0x018C18-Offset_0x018B14
                dc.w    Offset_0x018C1C-Offset_0x018B14
;-------------------------------------------------------------------------------  
Offset_0x018B1C:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Dust_Water_Splash_Mappings, Obj_Map(A0) ; Offset_0x018D30, $0004
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.w  #$049C, Obj_Art_VRAM(A0)                         ; $0002
                move.w  #$B000, Obj_Control_Var_12(A0)                   ; $003E
                move.w  #$9380, Obj_Control_Var_10(A0)                   ; $003C
                cmpa.w  #$B400, A0
                beq.s   Offset_0x018B64
                move.w  #$048C, Obj_Art_VRAM(A0)                         ; $0002
                move.w  #$B040, Obj_Control_Var_12(A0)                   ; $003E
                move.w  #$9180, Obj_Control_Var_10(A0)                   ; $003C
Offset_0x018B64:
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
;-------------------------------------------------------------------------------                
Offset_0x018B68:
                move.w  Obj_Control_Var_12(A0), A2                       ; $003E
                moveq   #$00, D0
                move.b  Obj_Ani_Number(A0), D0                           ; $001C
                add.w   D0, D0
                move.w  Offset_0x018B7C(PC, D0), D1
                jmp     Offset_0x018B7C(PC, D1)     
;-------------------------------------------------------------------------------   
Offset_0x018B7C:
                dc.w    Offset_0x018BFA-Offset_0x018B7C
                dc.w    Offset_0x018B84-Offset_0x018B7C
                dc.w    Offset_0x018BA4-Offset_0x018B7C
                dc.w    Offset_0x018BF2-Offset_0x018B7C            
;-------------------------------------------------------------------------------    
Offset_0x018B84:
                move.w  (Water_Level).w, Obj_Y(A0)                   ; $FFFFF646; $000C
                tst.b   Obj_Ani_Flag(A0)                                 ; $001D
                bne.s   Offset_0x018BFA
                move.w  Obj_X(A2), Obj_X(A0)                      ; $0008, $0008
                move.b  #$00, Obj_Status(A0)                             ; $0022
                andi.w  #$7FFF, Obj_Art_VRAM(A0)                         ; $0002
                bra.s   Offset_0x018BFA
;-------------------------------------------------------------------------------                 
Offset_0x018BA4:
                cmpi.b  #$0C, Obj_Subtype(A2)                            ; $0028
                bcs.s   Offset_0x018C10
                cmpi.b  #$04, Obj_Routine(A2)                            ; $0024
                bcc.s   Offset_0x018C10
                tst.b   Obj_Control_Var_0D(A2)                           ; $0039
                beq.s   Offset_0x018C10
                move.w  Obj_X(A2), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A2), Obj_Y(A0)                      ; $000C, $000C
                move.b  Obj_Status(A2), Obj_Status(A0)            ; $0022, $0022
                tst.b   Obj_Control_Var_13(A0)                           ; $003F
                beq.s   Offset_0x018BD8
                subi.w  #$0004, Obj_Y(A0)                                ; $000C
Offset_0x018BD8:
                tst.b   Obj_Ani_Flag(A0)                                 ; $001D
                bne.s   Offset_0x018BFA
                andi.w  #$7FFF, Obj_Art_VRAM(A0)                         ; $0002
                tst.w   Obj_Art_VRAM(A2)                                 ; $0002
                bpl.s   Offset_0x018BFA
                ori.w   #$8000, Obj_Art_VRAM(A0)                         ; $0002
                bra.s   Offset_0x018BFA
;-------------------------------------------------------------------------------                    
Offset_0x018BF2:
                cmpi.b  #$0C, Obj_Subtype(A2)                            ; $0028
                bcs.s   Offset_0x018C10
;-------------------------------------------------------------------------------                 
Offset_0x018BFA:
                lea     (Dust_Water_Splash_AnimateData), A1    ; Offset_0x018D0A
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                bsr     Load_Dust_Water_Splash_Dynamic_PLC     ; Offset_0x018CB6
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x018C10:
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                rts
;-------------------------------------------------------------------------------                 
Offset_0x018C18:
                bra     DeleteObject                           ; Offset_0x0120D0
;-------------------------------------------------------------------------------                  
Offset_0x018C1C:
                move.w  Obj_Control_Var_12(A0), A2                       ; $003E
                cmpi.b  #$0D, Obj_Ani_Number(A2)                         ; $001C
                beq.s   Offset_0x018C36
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$00, Obj_Control_Var_06(A0)                     ; $0032
                rts
Offset_0x018C36:
                subq.b  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bpl.s   Offset_0x018CB2
                move.b  #$03, Obj_Control_Var_06(A0)                     ; $0032
                bsr     SingleObjectLoad                       ; Offset_0x013BAA
                bne.s   Offset_0x018CB2
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.w  Obj_X(A2), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A2), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$0010, Obj_Y(A1)                                ; $000C
                tst.b   Obj_Control_Var_13(A0)                           ; $003F
                beq.s   Offset_0x018C6C
                subi.w  #$0004, Obj_Y(A1)                                ; $000C
Offset_0x018C6C:
                move.b  #$00, Obj_Status(A1)                             ; $0022
                move.b  #$03, Obj_Ani_Number(A1)                         ; $001C
                addq.b  #$02, Obj_Routine(A1)                            ; $0024
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                move.b  #$01, Obj_Priority(A1)                           ; $0018
                move.b  #$04, Obj_Width(A1)                              ; $0019
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.w  Obj_Control_Var_12(A0), Obj_Control_Var_12(A1); $003E, $003E
                andi.w  #$7FFF, Obj_Art_VRAM(A1)                         ; $0002
                tst.w   Obj_Art_VRAM(A2)                                 ; $0002
                bpl.s   Offset_0x018CB2
                ori.w   #$8000, Obj_Art_VRAM(A1)                         ; $0002
Offset_0x018CB2:
                bsr.s   Load_Dust_Water_Splash_Dynamic_PLC     ; Offset_0x018CB6
                rts
;-------------------------------------------------------------------------------                
Load_Dust_Water_Splash_Dynamic_PLC:                            ; Offset_0x018CB6
                moveq   #$00, D0
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                cmp.b   Obj_Control_Var_04(A0), D0                       ; $0030
                beq.s   Offset_0x018D08
                move.b  D0, Obj_Control_Var_04(A0)                       ; $0030
                lea     (Dust_Water_Splash_Dyn_Script), A2     ; Offset_0x018E46
                add.w   D0, D0
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D5
                subq.w  #$01, D5
                bmi.s   Offset_0x018D08
                move.w  Obj_Control_Var_10(A0), D4                       ; $003C
Loop_Load_Water_Splash_Dust:                                   ; Offset_0x018CDC
                moveq   #$00, D1
                move.w  (A2)+, D1
                move.w  D1, D3
                lsr.w   #$08, D3
                andi.w  #$00F0, D3
                addi.w  #$0010, D3
                andi.w  #$0FFF, D1
                lsl.l   #$05, D1
                addi.l  #Art_Water_Splash_Dust, D1             ; Offset_0x071FFC
                move.w  D4, D2
                add.w   D3, D4
                add.w   D3, D4
                jsr     (DMA_68KtoVRAM)                        ; Offset_0x0019E4
                dbra    D5, Loop_Load_Water_Splash_Dust        ; Offset_0x018CDC
Offset_0x018D08:
                rts 
;-------------------------------------------------------------------------------
Dust_Water_Splash_AnimateData:                                 ; Offset_0x018D0A
                dc.w    Offset_0x018D12-Dust_Water_Splash_AnimateData
                dc.w    Offset_0x018D15-Dust_Water_Splash_AnimateData
                dc.w    Offset_0x018D21-Dust_Water_Splash_AnimateData
                dc.w    Offset_0x018D2A-Dust_Water_Splash_AnimateData
Offset_0x018D12:
                dc.b    $1F, $00, $FF
Offset_0x018D15:
                dc.b    $03, $01, $02, $03, $04, $05, $06, $07
                dc.b    $08, $09, $FD, $00
Offset_0x018D21:
                dc.b    $01, $0A, $0B, $0C, $0D, $0E, $0F, $10
                dc.b    $FF
Offset_0x018D2A:
                dc.b    $03, $11, $12, $13, $14, $FC                
;-------------------------------------------------------------------------------
Dust_Water_Splash_Mappings:                                    ; Offset_0x018D30
                dc.w    Offset_0x018D5C-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018D5E-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018D68-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018D72-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018D7C-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018D86-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018D90-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018D9A-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018DA4-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018DAE-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018DB8-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018DC2-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018DCC-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018DD6-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018DE8-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018DFA-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018E0C-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018E1E-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018E28-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018E32-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018E3C-Dust_Water_Splash_Mappings
                dc.w    Offset_0x018D5C-Dust_Water_Splash_Mappings
Offset_0x018D5C:
                dc.w    $0000
Offset_0x018D5E:
                dc.w    $0001
                dc.l    $F20D0000, $0000FFF0
Offset_0x018D68:
                dc.w    $0001
                dc.l    $E20F0000, $0000FFF0
Offset_0x018D72:
                dc.w    $0001
                dc.l    $E20F0000, $0000FFF0
Offset_0x018D7C:
                dc.w    $0001
                dc.l    $E20F0000, $0000FFF0
Offset_0x018D86:
                dc.w    $0001
                dc.l    $E20F0000, $0000FFF0
Offset_0x018D90:
                dc.w    $0001
                dc.l    $E20F0000, $0000FFF0
Offset_0x018D9A:
                dc.w    $0001
                dc.l    $F20D0000, $0000FFF0
Offset_0x018DA4:
                dc.w    $0001
                dc.l    $F20D0000, $0000FFF0
Offset_0x018DAE:
                dc.w    $0001
                dc.l    $F20D0000, $0000FFF0
Offset_0x018DB8:
                dc.w    $0001
                dc.l    $040D0000, $0000FFE0
Offset_0x018DC2:
                dc.w    $0001
                dc.l    $040D0000, $0000FFE0
Offset_0x018DCC:
                dc.w    $0001
                dc.l    $040D0000, $0000FFE0
Offset_0x018DD6:
                dc.w    $0002
                dc.l    $F4010000, $0000FFE8
                dc.l    $040D0002, $0001FFE0
Offset_0x018DE8:
                dc.w    $0002
                dc.l    $F4050000, $0000FFE8
                dc.l    $040D0004, $0002FFE0
Offset_0x018DFA:
                dc.w    $0002
                dc.l    $F4090000, $0000FFE0
                dc.l    $040D0006, $0003FFE0
Offset_0x018E0C:
                dc.w    $0002
                dc.l    $F4090000, $0000FFE0
                dc.l    $040D0006, $0003FFE0
Offset_0x018E1E:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x018E28:
                dc.w    $0001
                dc.l    $F8050004, $0002FFF8
Offset_0x018E32:
                dc.w    $0001
                dc.l    $F8050008, $0004FFF8
Offset_0x018E3C:
                dc.w    $0001
                dc.l    $F805000C, $0006FFF8
;-------------------------------------------------------------------------------
Dust_Water_Splash_Dyn_Script:                                  ; Offset_0x018E46
                dc.w    Offset_0x018E72-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018E74-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018E78-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018E7C-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018E80-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018E84-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018E88-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018E8C-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018E90-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018E94-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018E98-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018E9C-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018EA0-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018EA4-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018EAA-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018EB0-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018EB6-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018EBC-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018EBC-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018EBC-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018EBC-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x018EBE-Dust_Water_Splash_Dyn_Script
Offset_0x018E72:
                dc.w    $0000
Offset_0x018E74:
                dc.w    $0001
                dc.w    $7000
Offset_0x018E78:
                dc.w    $0001
                dc.w    $F008
Offset_0x018E7C:
                dc.w    $0001
                dc.w    $F018
Offset_0x018E80:
                dc.w    $0001
                dc.w    $F028
Offset_0x018E84:
                dc.w    $0001
                dc.w    $F038
Offset_0x018E88:
                dc.w    $0001
                dc.w    $F048
Offset_0x018E8C:
                dc.w    $0001
                dc.w    $7058
Offset_0x018E90:
                dc.w    $0001
                dc.w    $7060
Offset_0x018E94:
                dc.w    $0001
                dc.w    $7068
Offset_0x018E98:
                dc.w    $0001
                dc.w    $7070
Offset_0x018E9C:
                dc.w    $0001
                dc.w    $7078
Offset_0x018EA0:
                dc.w    $0001
                dc.w    $7080
Offset_0x018EA4:
                dc.w    $0002
                dc.w    $1088, $708A
Offset_0x018EAA:
                dc.w    $0002
                dc.w    $3092, $7096                                             
Offset_0x018EB0:
                dc.w    $0002
                dc.w    $509E, $70A4
Offset_0x018EB6:
                dc.w    $0002
                dc.w    $50AC, $70B2
Offset_0x018EBC:
                dc.w    $0000
Offset_0x018EBE:
                dc.w    $0001
                dc.w    $F0BA
;===============================================================================
; Objeto 0x08 - Poeira do Spindash / freio e Splash de água
; <<<-
;===============================================================================