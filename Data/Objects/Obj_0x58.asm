;===============================================================================
; Objeto 0x58 - Explosões dos chefes sendo derrotados
; ->>>        
;===============================================================================  
; Offset_0x028D28:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x028D36(PC, D0), D1
                jmp     Offset_0x028D36(PC, D1)   
;-------------------------------------------------------------------------------                   
Offset_0x028D36:
                dc.w    Offset_0x028D3A-Offset_0x028D36
                dc.w    Offset_0x028D80-Offset_0x028D36  
;------------------------------------------------------------------------------- 
Offset_0x028D3A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Boss_Explosions_Mappings, Obj_Map(A0) ; Offset_0x028D9E, $0004
                move.w  #$8580, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_35_To_ModifySpriteAttr_2P          ; Offset_0x028FD6
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$00, Obj_Priority(A0)                           ; $0018
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$0C, Obj_Width(A0)                              ; $0019
                move.b  #$07, Obj_Ani_Time(A0)                           ; $001E
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                move.w  #$00C4, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912   
;-------------------------------------------------------------------------------  
; Offset_0x028D7E:
                rts                                                              
;------------------------------------------------------------------------------- 
Offset_0x028D80:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x028D9A
                move.b  #$07, Obj_Ani_Time(A0)                           ; $001E
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                cmpi.b  #$07, Obj_Map_Id(A0)                             ; $001A
                beq     Jmp_1D_To_DeleteObject                 ; Offset_0x028FCA
Offset_0x028D9A:
                bra     Jmp_1A_To_DisplaySprite                ; Offset_0x028FC4                                          
;-------------------------------------------------------------------------------  
Boss_Explosions_Mappings:                                      ; Offset_0x028D9E
                dc.w    Offset_0x028DAC-Boss_Explosions_Mappings
                dc.w    Offset_0x028DB6-Boss_Explosions_Mappings
                dc.w    Offset_0x028DC0-Boss_Explosions_Mappings
                dc.w    Offset_0x028DCA-Boss_Explosions_Mappings
                dc.w    Offset_0x028DD4-Boss_Explosions_Mappings
                dc.w    Offset_0x028DDE-Boss_Explosions_Mappings
                dc.w    Offset_0x028DE8-Boss_Explosions_Mappings
Offset_0x028DAC:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x028DB6:
                dc.w    $0001
                dc.l    $F00F0004, $0002FFF0
Offset_0x028DC0:
                dc.w    $0001
                dc.l    $F00F0014, $000AFFF0
Offset_0x028DCA:
                dc.w    $0001
                dc.l    $F00F0024, $0012FFF0
Offset_0x028DD4:
                dc.w    $0001
                dc.l    $F00F0034, $001AFFF0
Offset_0x028DDE:
                dc.w    $0001
                dc.l    $F00F0044, $0022FFF0
Offset_0x028DE8:
                dc.w    $0001
                dc.l    $F00F0054, $002AFFF0                                                                           
;===============================================================================   
; Objeto 0x58 - Explosões dos chefes sendo derrotados
; <<<-        
;===============================================================================