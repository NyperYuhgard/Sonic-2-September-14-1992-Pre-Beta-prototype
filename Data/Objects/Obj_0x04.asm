;===============================================================================
; Objeto 0x04 - Superfície da água na Hidden Palace, Chemical Plant e
; ->>>          Neo Green Hill
;===============================================================================     
; Offset_0x01B368:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01B376(PC, D0), D1
                jmp     Offset_0x01B376(PC, D1)
;-------------------------------------------------------------------------------    
Offset_0x01B376:
                dc.w    Offset_0x01B37C-Offset_0x01B376
                dc.w    Offset_0x01B3BC-Offset_0x01B376
                dc.w    Offset_0x01B44E-Offset_0x01B376              
;-------------------------------------------------------------------------------  
Offset_0x01B37C:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Water_Surface_Mappings, Obj_Map(A0) ; Offset_0x01B49A, $0004
                move.w  #$8400, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_04_To_ModifySpriteAttr_2P          ; Offset_0x01BF62
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$80, Obj_Width(A0)                              ; $0019
                move.w  Obj_X(A0), Obj_Control_Var_04(A0)         ; $0008, $0030
                cmpi.b  #$0F, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x01B3BC
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #NGHz_Water_Surface_Mappings, Obj_Map(A0) ; Offset_0x01B58A, $0004
                bra     Offset_0x01B44E      
;-------------------------------------------------------------------------------  
Offset_0x01B3BC:
                move.w  (Water_Level).w, D1                          ; $FFFFF646
                move.w  D1, Obj_Y(A0)                                    ; $000C
                tst.b   Obj_Control_Var_06(A0)                           ; $0032
                bne.s   Offset_0x01B3DE
                btst    #$07, (Control_Ports_Buffer_Data+$0001).w    ; $FFFFF605
                beq.s   Offset_0x01B3EE
                addq.b  #$03, Obj_Map_Id(A0)                             ; $001A
                move.b  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bra.s   Offset_0x01B3EE
Offset_0x01B3DE:
                tst.w   (Pause_Status).w                             ; $FFFFF63A
                bne.s   Offset_0x01B3EE
                move.b  #$00, Obj_Control_Var_06(A0)                     ; $0032
                subq.b  #$03, Obj_Map_Id(A0)                             ; $001A
Offset_0x01B3EE:
                lea     (Water_Surface_Data), A1               ; Offset_0x01B40E
                moveq   #$00, D1
                move.b  Obj_Ani_Frame(A0), D1                            ; $001B
                move.b  $00(A1, D1), Obj_Map_Id(A0)                      ; $001A
                addq.b  #$01, Obj_Ani_Frame(A0)                          ; $001B
                andi.b  #$3F, Obj_Ani_Frame(A0)                          ; $001B
                bra     Jmp_04_To_DisplaySprite                ; Offset_0x01BF50
;-------------------------------------------------------------------------------
Water_Surface_Data:                                            ; Offset_0x01B40E
                dc.b    $00, $01, $00, $01, $00, $01, $00, $01
                dc.b    $00, $01, $00, $01, $00, $01, $00, $01
                dc.b    $01, $02, $01, $02, $01, $02, $01, $02
                dc.b    $01, $02, $01, $02, $01, $02, $01, $02
                dc.b    $02, $01, $02, $01, $02, $01, $02, $01
                dc.b    $02, $01, $02, $01, $02, $01, $02, $01
                dc.b    $01, $00, $01, $00, $01, $00, $01, $00
                dc.b    $01, $00, $01, $00, $01, $00, $01, $00               
;-------------------------------------------------------------------------------    
Offset_0x01B44E:
                move.w  (Water_Level).w, D1                          ; $FFFFF646
                move.w  D1, Obj_Y(A0)                                    ; $000C
                tst.b   Obj_Control_Var_06(A0)                           ; $0032
                bne.s   Offset_0x01B470
                btst    #$07, (Control_Ports_Buffer_Data+$0001).w    ; $FFFFF605
                beq.s   Offset_0x01B480
                addq.b  #$02, Obj_Map_Id(A0)                             ; $001A
                move.b  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bra.s   Offset_0x01B496
Offset_0x01B470:
                tst.w   (Pause_Status).w                             ; $FFFFF63A
                bne.s   Offset_0x01B496
                move.b  #$00, Obj_Control_Var_06(A0)                     ; $0032
                subq.b  #$02, Obj_Map_Id(A0)                             ; $001A
Offset_0x01B480:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x01B496
                move.b  #$05, Obj_Ani_Time(A0)                           ; $001E
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                andi.b  #$01, Obj_Map_Id(A0)                             ; $001A
Offset_0x01B496:
                bra     Jmp_04_To_DisplaySprite                ; Offset_0x01BF50
;-------------------------------------------------------------------------------
Water_Surface_Mappings:                                        ; Offset_0x01B49A
                dc.w    Offset_0x01B4A6-Water_Surface_Mappings
                dc.w    Offset_0x01B4C0-Water_Surface_Mappings
                dc.w    Offset_0x01B4DA-Water_Surface_Mappings
                dc.w    Offset_0x01B4F4-Water_Surface_Mappings
                dc.w    Offset_0x01B526-Water_Surface_Mappings
                dc.w    Offset_0x01B558-Water_Surface_Mappings
Offset_0x01B4A6:
                dc.w    $0003
                dc.l    $F80D0000, $0000FFA0
                dc.l    $F80D0000, $0000FFE0
                dc.l    $F80D0000, $00000020
Offset_0x01B4C0:
                dc.w    $0003
                dc.l    $F80D0008, $0004FFA0
                dc.l    $F80D0008, $0004FFE0
                dc.l    $F80D0008, $00040020
Offset_0x01B4DA:
                dc.w    $0003
                dc.l    $F80D0010, $0008FFA0
                dc.l    $F80D0010, $0008FFE0
                dc.l    $F80D0010, $00080020
Offset_0x01B4F4:
                dc.w    $0006
                dc.l    $F80D0000, $0000FFA0
                dc.l    $F80D0008, $0004FFC0
                dc.l    $F80D0000, $0000FFE0
                dc.l    $F80D0008, $00040000
                dc.l    $F80D0000, $00000020
                dc.l    $F80D0008, $00040040
Offset_0x01B526:
                dc.w    $0006
                dc.l    $F80D0008, $0004FFA0
                dc.l    $F80D0010, $0008FFC0
                dc.l    $F80D0008, $0004FFE0
                dc.l    $F80D0010, $00080000
                dc.l    $F80D0008, $00040020
                dc.l    $F80D0010, $00080040
Offset_0x01B558:
                dc.w    $0006
                dc.l    $F80D0010, $0008FFA0
                dc.l    $F80D0008, $0004FFC0
                dc.l    $F80D0010, $0008FFE0
                dc.l    $F80D0008, $00040000
                dc.l    $F80D0010, $00080020
                dc.l    $F80D0008, $00040040                
;-------------------------------------------------------------------------------
NGHz_Water_Surface_Mappings:                                   ; Offset_0x01B58A
                dc.w    Offset_0x01B592-NGHz_Water_Surface_Mappings
                dc.w    Offset_0x01B5AC-NGHz_Water_Surface_Mappings
                dc.w    Offset_0x01B5C6-NGHz_Water_Surface_Mappings
                dc.w    Offset_0x01B5F8-NGHz_Water_Surface_Mappings
Offset_0x01B592:
                dc.w    $0003
                dc.l    $FC0D0000, $0000FFA0
                dc.l    $FC0D0000, $0000FFE0
                dc.l    $FC0D0000, $00000020
Offset_0x01B5AC:
                dc.w    $0003
                dc.l    $FC0D0008, $0004FFA0
                dc.l    $FC0D0008, $0004FFE0
                dc.l    $FC0D0008, $00040020
Offset_0x01B5C6:
                dc.w    $0006
                dc.l    $FC0D0000, $0000FFA0
                dc.l    $FC0D0000, $0000FFC0
                dc.l    $FC0D0000, $0000FFE0
                dc.l    $FC0D0000, $00000000
                dc.l    $FC0D0000, $00000020
                dc.l    $FC0D0000, $00000040
Offset_0x01B5F8:
                dc.w    $0006
                dc.l    $FC0D0008, $0004FFA0
                dc.l    $FC0D0008, $0004FFC0
                dc.l    $FC0D0008, $0004FFE0
                dc.l    $FC0D0008, $00040000
                dc.l    $FC0D0008, $00040020
                dc.l    $FC0D0008, $00040040
;===============================================================================   
; Objeto 0x04 - Superfície da água na Hidden Palace, Chemical Plant e
; <<<-          Neo Green Hill
;===============================================================================