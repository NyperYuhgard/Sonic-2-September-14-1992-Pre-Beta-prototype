;===============================================================================
; Objeto 0x71 - Miscelânea de objetos - Suporte das pontes na Hidden Palace,
; ->>>          Orbs na Hidden Palace, bolhas de lava na Metropolis, etc...
;===============================================================================
; Offset_0x00E504:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00E512(PC, D0), D1
                jmp     Offset_0x00E512(PC, D1)
;-------------------------------------------------------------------------------                      
Offset_0x00E512:                   
                dc.w    Offset_0x00E52E-Offset_0x00E512
                dc.w    Offset_0x00E570-Offset_0x00E512      
;-------------------------------------------------------------------------------                   
Misc_Object_Definitions_List_2:                                ; Offset_0x00E516
                dc.l    ($03<<$18)|HPz_Bridge_Mappings         ; Offset_0x00CECC
                dc.w    $6300
                dc.b    $04, $01
                dc.l    Hpz_Orbs_Mappings                      ; Offset_0x00E5AA
                dc.w    $E35A
                dc.b    $10, $01
                dc.l    Mz_Lava_Bubble_Mappings                ; Offset_0x00E66E
                dc.w    $4536
                dc.b    $10, $01                                 
;-------------------------------------------------------------------------------
Offset_0x00E52E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$000F, D0
                lsl.w   #$03, D0
                lea     Misc_Object_Definitions_List_2(PC), A1 ; Offset_0x00E516
                lea     $00(A1, D0), A1
                move.b  (A1), Obj_Map_Id(A0)                             ; $001A
                move.l  (A1)+, Obj_Map(A0)                               ; $0004
                move.w  (A1)+, Obj_Art_VRAM(A0)                          ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  (A1)+, Obj_Width(A0)                             ; $0019
                move.b  (A1)+, Obj_Priority(A0)                          ; $0018
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$00F0, D0
                lsr.b   #$04, D0
                move.b  D0, Obj_Ani_Number(A0)                           ; $001C
;-------------------------------------------------------------------------------                
Offset_0x00E570:
                lea     (Mz_Hpz_Misc_Animate_Data), A1         ; Offset_0x00E57E
                bsr     AnimateSprite                          ; Offset_0x01212E
                bra     MarkObjGone                            ; Offset_0x011FBC 
;-------------------------------------------------------------------------------
Mz_Hpz_Misc_Animate_Data:                                      ; Offset_0x00E57E
                dc.w    Offset_0x00E586-Mz_Hpz_Misc_Animate_Data
                dc.w    Offset_0x00E58E-Mz_Hpz_Misc_Animate_Data
                dc.w    Offset_0x00E59D-Mz_Hpz_Misc_Animate_Data
                dc.w    Offset_0x00E5A6-Mz_Hpz_Misc_Animate_Data
Offset_0x00E586:
                dc.b    $08, $03, $03, $04, $05, $05, $04, $FF
Offset_0x00E58E:
                dc.b    $05, $00, $00, $00, $01, $02, $03, $03, $02, $01, $02, $03, $03, $01, $FF
Offset_0x00E59D:
                dc.b    $0B, $00, $01, $02, $03, $04, $05, $FD, $03
Offset_0x00E5A6:
                dc.b    $7F, $06, $FD, $02  
;-------------------------------------------------------------------------------
Hpz_Orbs_Mappings:                                             ; Offset_0x00E5AA
                dc.w    Offset_0x00E5B2-Hpz_Orbs_Mappings
                dc.w    Offset_0x00E5BC-Hpz_Orbs_Mappings
                dc.w    Offset_0x00E5C6-Hpz_Orbs_Mappings
                dc.w    Offset_0x00E5D8-Hpz_Orbs_Mappings
Offset_0x00E5B2:
                dc.w    $0001
                dc.l    $F40A0000, $0000FFF4
Offset_0x00E5BC:
                dc.w    $0001
                dc.l    $F40A0009, $0004FFF4
Offset_0x00E5C6:
                dc.w    $0002
                dc.l    $F00D0012, $0009FFF0, $000D1812, $1809FFF0
Offset_0x00E5D8:
                dc.w    $0002
                dc.l    $F00D001A, $000DFFF0, $000D181A, $180DFFF0           
;===============================================================================
; Objeto 0x71 - Miscelânea de objetos - Suporte das pontes na Hidden Palace,
; <<<-          Orbs na Hidden Palace, bolhas de lava na Metropolis, etc...
;===============================================================================