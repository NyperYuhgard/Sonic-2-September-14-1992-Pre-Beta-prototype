;===============================================================================
; Objeto 0x61 - Bombas no Special Stage
; ->>> 
;===============================================================================
; Offset_0x030218:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x030226(PC, D0), D1
                jmp     Offset_0x030226(PC, D1)
;-------------------------------------------------------------------------------      
Offset_0x030226:
                dc.w    Offset_0x03022E-Offset_0x030226
                dc.w    Offset_0x03026C-Offset_0x030226
                dc.w    Offset_0x03058A-Offset_0x030226
                dc.w    Offset_0x03029E-Offset_0x030226
;-------------------------------------------------------------------------------    
Offset_0x03022E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$007F, Obj_X(A0)                                ; $0008
                move.w  #$0058, Obj_Y(A0)                                ; $000C
                move.l  #SS_Bombs_Mappings, Obj_Map(A0) ; Offset_0x03092C, $0004
                move.w  #$23C0, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.b  #$02, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$FF, ($FFFF9B4D).w
                bsr     Offset_0x0304F4
                move.l  A1, Obj_Control_Var_08(A0)                       ; $0034
;-------------------------------------------------------------------------------                  
Offset_0x03026C:
                bsr     Offset_0x0303A2
                bsr     Offset_0x030436
                lea     (SS_Bombs_Animate_Data), A1            ; Offset_0x0308F2
                bsr     Offset_0x0305E8
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x03028E
                bsr     Jmp_25_To_DisplaySprite                ; Offset_0x030A10
                bsr     Offset_0x030290
                bra.s   Offset_0x0302B4
Offset_0x03028E:
                rts
Offset_0x030290:
                tst.b   Obj_Col_Flags(A0)                                ; $0020
                bne.s   Offset_0x03029C
                move.b  #$0A, Obj_Ani_Number(A0)                         ; $001C
Offset_0x03029C:
                rts
Offset_0x03029E:
                bsr     Offset_0x0303A2
                bsr     Offset_0x030436
Offset_0x0302A6:
                lea     (SS_Bombs_Animate_Data), A1            ; Offset_0x0308F2
                bsr     Jmp_19_To_AnimateSprite                ; Offset_0x030A1C
                bra     Jmp_25_To_DisplaySprite                ; Offset_0x030A10
Offset_0x0302B4:
                cmpi.b  #$0A, Obj_Ani_Number(A0)                         ; $001C
                bne.s   Offset_0x0302CC
                move.w  #$43D0, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$06, Obj_Routine(A0)                            ; $0024
                bra     Offset_0x0302A6
Offset_0x0302CC:
                moveq   #$00, D0
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                cmp.b   ($FFFF9B4D).w, D0
                beq.s   Offset_0x030314
                move.b  D0, ($FFFF9B4D).w
                move.l  #$00FF31A0, D6
                lea     (Sonic_In_SS_Dyn_Script), A2           ; Offset_0x02F94E
                addi.w  #$0012, D0
                add.w   D0, D0
                adda.w  $00(A2, D0), A2
                move.w  #$7800, D2
                moveq   #$00, D1
                move.w  (A2)+, D1
                move.w  D1, D3
                lsr.w   #$08, D3
                andi.w  #$00F0, D3
                addi.w  #$0010, D3
                andi.w  #$0FFF, D1
                lsl.w   #$01, D1
                add.l   D6, D1
                jsr     (DMA_68KtoVRAM)                        ; Offset_0x0019E4
Offset_0x030314:
                rts                         
;===============================================================================
; Objeto 0x61 - Bombas no Special Stage
; <<<- 
;===============================================================================