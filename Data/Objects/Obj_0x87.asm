;===============================================================================
; Objeto 0x87 - Mostrador de anéis no Special Stage
; ->>> 
;===============================================================================
; Offset_0x0094FA:
                moveq   #$00, D0
                move.b  Obj_Sub_Y(A0), D0                                ; $000A
                move.w  Offset_0x009508(PC, D0), D1
                jmp     Offset_0x009508(PC, D1)
;-------------------------------------------------------------------------------    
Offset_0x009508:
                dc.w    Offset_0x00950C-Offset_0x009508
                dc.w    Offset_0x009570-Offset_0x009508
;-------------------------------------------------------------------------------   
Offset_0x00950C:
                move.b  #$02, Obj_Sub_Y(A0)                              ; $000A
                move.w  #$0044, Obj_X(A0)                                ; $0008
                move.w  #$0020, Obj_Y(A0)                                ; $000C
                move.l  #SS_Counter_Numbers_Mappings, Obj_Map(A0) ; Offset_0x009482, $0004
                move.w  #$4237, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$00, Obj_Priority(A0)                           ; $0018
                bset    #$06, Obj_Flags(A0)                              ; $0001
                move.b  #$06, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                moveq   #$44, D0
                moveq   #$20, D1
                moveq   #$00, D2
                moveq   #$02, D3
                lea     Obj_Speed(A0), A1                                ; $0010
Offset_0x009550:
                move.w  D0, (A1)+
                move.w  D1, (A1)+
                move.w  D2, (A1)+
                addq.w  #$08, D0
                dbra    D3, Offset_0x009550
                move.w  #$00DC, D0
                moveq   #$02, D3
Offset_0x009562:
                move.w  D0, (A1)+
                move.w  D1, (A1)+
                move.w  D2, (A1)+
                addq.w  #$08, D0
                dbra    D3, Offset_0x009562
                rts
;-------------------------------------------------------------------------------
Offset_0x009570:
                moveq   #$00, D0
                move.w  ($FFFFB03E).w, D0
                divu.w  #$0064, D0
                move.w  D0, D1
                swap.w  D0
                andi.l  #$0000FFFF, D0
                divu.w  #$000A, D0
                lea     Obj_Speed(A0), A1                                ; $0010
                move.b  D1, $0005(A1)
                move.b  D0, Obj_Boss_Ani_Map(A1)                         ; $000B
                swap.w  D0
                move.b  D0, $0011(A1)
                moveq   #$00, D0
                move.w  ($FFFFB07E).w, D0
                divu.w  #$0064, D0
                move.w  D0, D1
                swap.w  D0
                andi.l  #$0000FFFF, D0
                divu.w  #$000A, D0
                move.b  D1, Obj_Width_2(A1)                              ; $0017
                move.b  D0, Obj_Ani_Flag(A1)                             ; $001D
                swap.w  D0
                move.b  D0, Obj_Respaw_Ref(A1)                           ; $0023
                bra     Jmp_00_To_DisplaySprite                ; Offset_0x009694                            
;===============================================================================
; Objeto 0x87 - Mostrador de anéis no Special Stage
; <<<- 
;===============================================================================