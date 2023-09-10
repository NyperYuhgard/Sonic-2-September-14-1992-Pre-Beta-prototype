;===============================================================================
; Objeto 0x27 - Rotina de resposta ao toque nos objetos das fases
; ->>>
;===============================================================================
Offset_0x01BB26:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01BB34(PC, D0), D1
                jmp     Offset_0x01BB34(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x01BB34:
                dc.w    Offset_0x01BB3A-Offset_0x01BB34
                dc.w    Offset_0x01BB5C-Offset_0x01BB34
                dc.w    Offset_0x01BBA0-Offset_0x01BB34
;-------------------------------------------------------------------------------    
Offset_0x01BB3A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bsr     SingleObjectLoad                       ; Offset_0x013BAA
                bne.s   Offset_0x01BB5C
                move.b  #$28, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  Obj_Control_Var_12(A0), Obj_Control_Var_12(A1); $003E, $003E
Offset_0x01BB5C:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Object_Hit_Mappings, Obj_Map(A0) ; Offset_0x01BBBE, $0004
                move.w  #$05A4, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_04_To_ModifySpriteAttr_2P          ; Offset_0x01BF62
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$0C, Obj_Width(A0)                              ; $0019
                move.b  #$03, Obj_Ani_Time(A0)                           ; $001E
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                move.w  #$00C1, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x01BBA0:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x01BBBA
                move.b  #$07, Obj_Ani_Time(A0)                           ; $001E
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                cmpi.b  #$05, Obj_Map_Id(A0)                             ; $001A
                beq     Jmp_04_To_DeleteObject                 ; Offset_0x01BF56
Offset_0x01BBBA:
                bra     Jmp_04_To_DisplaySprite                ; Offset_0x01BF50
;-------------------------------------------------------------------------------            
Object_Hit_Mappings:                                           ; Offset_0x01BBBE
                dc.w    Offset_0x01BBC8-Object_Hit_Mappings
                dc.w    Offset_0x01BBD2-Object_Hit_Mappings
                dc.w    Offset_0x01BBDC-Object_Hit_Mappings
                dc.w    Offset_0x01BBE6-Object_Hit_Mappings
                dc.w    Offset_0x01BBF0-Object_Hit_Mappings  
Offset_0x01BBC8:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x01BBD2:
                dc.w    $0001
                dc.l    $F00F2004, $2002FFF0
Offset_0x01BBDC:
                dc.w    $0001
                dc.l    $F00F2014, $200AFFF0
Offset_0x01BBE6:
                dc.w    $0001
                dc.l    $F00F2024, $2012FFF0
Offset_0x01BBF0:
                dc.w    $0001
                dc.l    $F00F2034, $201AFFF0                 
;===============================================================================
; Objeto 0x27 - Rotina de resposta ao toque nos objetos das fases
; <<<-
;===============================================================================