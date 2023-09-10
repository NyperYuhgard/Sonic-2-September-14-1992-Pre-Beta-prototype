;===============================================================================
; Objeto 0x88 - Rabo do Miles no Special Stage
; ->>> 
;===============================================================================
; Offset_0x02FDDE:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.b  Obj_Flags(A1), Obj_Flags(A0)              ; $0001, $0001
                move.b  Obj_Status(A1), Obj_Status(A0)            ; $0022, $0022
                move.b  Obj_Ani_Number(A1), Obj_Ani_Number(A0)    ; $001C, $001C
                cmpi.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                bcc.s   Offset_0x02FE1A
                lea     (Miles_Tail_In_SS_AnimateData), A1     ; Offset_0x0300EC
                bsr     Jmp_18_To_AnimateSprite                ; Offset_0x030212
                bsr     Offset_0x02FE28
                bra     Jmp_24_To_DisplaySprite                ; Offset_0x03020C
Offset_0x02FE1A:
                rts      
;-------------------------------------------------------------------------------  
Art_SS_Miles_Tail_Ram_Buffer:                                  ; Offset_0x02FE1C
                dc.l    $00FF6100, $00FF67A0, $00FF6F00
;------------------------------------------------------------------------------- 
Offset_0x02FE28:
                moveq   #$00, D0
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                cmp.b   ($FFFFF7DF).w, D0
                beq.s   Offset_0x02FE80
                move.b  D0, ($FFFFF7DF).w
                moveq   #$00, D6
                cmpi.b  #$07, D0
                blt.s   Offset_0x02FE4A
                addq.w  #$04, D6
                cmpi.b  #$0E, D0
                blt.s   Offset_0x02FE4A
                addq.w  #$04, D6
Offset_0x02FE4A:
                move.l  Art_SS_Miles_Tail_Ram_Buffer(PC, D6), D6 ; Offset_0x02FE1C
                addi.w  #$0044, D0
                add.w   D0, D0
                lea     (Miles_Tail_In_SS_Dyn_Script), A2      ; Offset_0x02F94E
                adda.w  $00(A2, D0), A2
                move.w  #$6EA0, D2
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
Offset_0x02FE80:
                rts                                                                                                                                                                  
;===============================================================================
; Objeto 0x88 - Rabo do Miles no Special Stage
; <<<- 
;===============================================================================