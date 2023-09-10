;===============================================================================
; Objeto 0x9C - Fogo da turbina usada pelos inimigos Tutloid e Balkiry
; ->>>          Objeto utilizado pelo 0x9A e 0xAC
;===============================================================================  
; Offset_0x031ED0:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x031EDE(PC, D0), D1
                jmp     Offset_0x031EDE(PC, D1)     
;-------------------------------------------------------------------------------
Offset_0x031EDE:
                dc.w    Offset_0x031EE2-Offset_0x031EDE
                dc.w    Offset_0x031EE6-Offset_0x031EDE      
;-------------------------------------------------------------------------------    
Offset_0x031EE2:
                bra     Object_Settings                        ; Offset_0x030A30 
;-------------------------------------------------------------------------------
Offset_0x031EE6:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                move.b  Obj_Control_Var_06(A0), D0                       ; $0032
                cmp.b   (A1), D0
                bne     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                move.l  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.l  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.l  Obj_Control_Var_02(A0), A1                       ; $002E
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Offset_0x030C32                                      
;-------------------------------------------------------------------------------
Load_Enemy_Boost_Sub_Obj_0x9C:                                 ; Offset_0x031F0C
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x031F3E
                move.b  #$9C, Obj_Id(A1)                                 ; $0000
                move.b  #$06, Obj_Map_Id(A1)                             ; $001A
                move.b  #$1A, Obj_Subtype(A1)                            ; $0028
                move.w  A0, Obj_Control_Var_00(A1)                       ; $002C
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.l  Obj_Control_Var_02(A0), Obj_Control_Var_02(A1); $002E, $002E
                move.b  (A0), Obj_Control_Var_06(A1)                     ; $0032
Offset_0x031F3E:
                rts
;-------------------------------------------------------------------------------
Load_Turtloid_Weapon:                                          ; Offset_0x031F40
                bsr     Jmp_10_To_SingleObjectLoad             ; Offset_0x037602
                bne.s   Offset_0x031F7E
                move.b  #$98, Obj_Id(A1)                                 ; $0000
                move.b  #$06, Obj_Map_Id(A1)                             ; $001A
                move.b  #$1C, Obj_Subtype(A1)                            ; $0028
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                subi.w  #$0014, Obj_X(A1)                                ; $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$000A, Obj_Y(A1)                                ; $000C
                move.w  #$FF00, Obj_Speed(A1)                            ; $0010
                lea     Turtloid_Weapon(PC), A2                ; Offset_0x031B68
                move.l  A2, Obj_Timer(A1)                                ; $002A
Offset_0x031F7E:
                rts          
;-------------------------------------------------------------------------------    
Obj_0x9A_Ptr:                                                  ; Offset_0x031F80
                dc.l    Turtloid_Mappings                      ; Offset_0x031FB0
                dc.w    $038A
                dc.b    $04, $05, $18, $00   
;-------------------------------------------------------------------------------                   
Obj_0x9B_Ptr:                                                  ; Offset_0x031F8A
                dc.l    Turtloid_Mappings                      ; Offset_0x031FB0
                dc.w    $038A
                dc.b    $04, $04, $0C, $1A  
;-------------------------------------------------------------------------------                      
Obj_0x9C_Ptr:                                                  ; Offset_0x031F94
                dc.l    Turtloid_Mappings                      ; Offset_0x031FB0
                dc.w    $038A
                dc.b    $04, $05, $08, $00       
;-------------------------------------------------------------------------------
Turtloid_Weapon_Animate_Data:                                  ; Offset_0x031F9E
                dc.w    Offset_0x031FA0-Turtloid_Weapon_Animate_Data
Offset_0x031FA0:
                dc.b    $01, $04, $05, $FF          
;-------------------------------------------------------------------------------
Turtloid_Animate_Data:                                         ; Offset_0x031FA4
                dc.w    Offset_0x031FA6-Turtloid_Animate_Data
Offset_0x031FA6:
                dc.b    $01, $06, $07, $FF    
;-------------------------------------------------------------------------------
Balkiry_Animate_Data:                                          ; Offset_0x031FAA
                dc.w    Offset_0x031FAC-Balkiry_Animate_Data
Offset_0x031FAC:
                dc.b    $01, $08, $09, $FF       
;-------------------------------------------------------------------------------
Turtloid_Mappings:                                             ; Offset_0x031FB0
                dc.w    Offset_0x031FC4-Turtloid_Mappings
                dc.w    Offset_0x031FDE-Turtloid_Mappings
                dc.w    Offset_0x031FF8-Turtloid_Mappings
                dc.w    Offset_0x032002-Turtloid_Mappings
                dc.w    Offset_0x03200C-Turtloid_Mappings
                dc.w    Offset_0x032016-Turtloid_Mappings
                dc.w    Offset_0x032020-Turtloid_Mappings
                dc.w    Offset_0x03202A-Turtloid_Mappings
                dc.w    Offset_0x032034-Turtloid_Mappings
                dc.w    Offset_0x03203E-Turtloid_Mappings
Offset_0x031FC4:
                dc.w    $0003
                dc.l    $F0092000, $2000FFE4
                dc.l    $F00F2006, $2003FFFC
                dc.l    $00092016, $200BFFE4
Offset_0x031FDE:
                dc.w    $0003
                dc.l    $F0092000, $2000FFE4
                dc.l    $0009201C, $200EFFE4
                dc.l    $F00F2006, $2003FFFC
Offset_0x031FF8:
                dc.w    $0001
                dc.l    $F40A2022, $2011FFF4
Offset_0x032002:
                dc.w    $0001
                dc.l    $F40A202B, $2015FFF4
Offset_0x03200C:
                dc.w    $0001
                dc.l    $FC002034, $201AFFFC
Offset_0x032016:
                dc.w    $0001
                dc.l    $FC002035, $201AFFFC
Offset_0x032020:
                dc.w    $0001
                dc.l    $06040036, $001B001C
Offset_0x03202A:
                dc.w    $0001
                dc.l    $06000038, $001C001C
Offset_0x032034:
                dc.w    $0001
                dc.l    $FB040036, $001B001B
Offset_0x03203E:
                dc.w    $0001
                dc.l    $FB000038, $001C001B
;===============================================================================   
; Objeto 0x9C - Fogo da turbina usada pelos inimigos Tutloid e Balkiry
; <<<-          Objeto utilizado pelo 0x9A e 0xAC
;===============================================================================