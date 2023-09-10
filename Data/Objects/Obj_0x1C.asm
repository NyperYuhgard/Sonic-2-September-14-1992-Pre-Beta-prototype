;===============================================================================
; Objeto 0x1C - Miscelânea de objetos - Suporte das pontes na Emerald Hill,
; ->>>          postes na Hill Top, etc...
;===============================================================================  
; Offset_0x00E44C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00E45A(PC, D0), D1
                jmp     Offset_0x00E45A(PC, D1)   
;-------------------------------------------------------------------------------
Offset_0x00E45A:                 
                dc.w    Offset_0x00E4CE-Offset_0x00E45A
                dc.w    Offset_0x00E500-Offset_0x00E45A    
;-------------------------------------------------------------------------------                 
Misc_Object_Definitions_List:                                  ; Offset_0x00E45E
                dc.l    Mz_Misc_Mappings                       ; Offset_0x00E64A
                dc.w    $43FD
                dc.b    $04, $06
                dc.l    ($01<<$18)|Mz_Misc_Mappings            ; Offset_0x00E64A
                dc.w    $43FD
                dc.b    $04, $06
                dc.l    ($01<<$18)|GHz_Bridge_Mappings         ; Offset_0x00CF14
                dc.w    $43B6
                dc.b    $04, $01
                dc.l    ($02<<$18)|Mz_Misc_Mappings            ; Offset_0x00E64A
                dc.w    $23FD
                dc.b    $10, $06
                dc.l    ($03<<$18)|Teleferics_Mappings         ; Offset_0x01C98A
                dc.w    $43E6
                dc.b    $08, $04
                dc.l    ($04<<$18)|Teleferics_Mappings         ; Offset_0x01C98A
                dc.w    $43E6
                dc.b    $08, $04
                dc.l    ($01<<$18)|Teleferics_Mappings         ; Offset_0x01C98A
                dc.w    $43E6
                dc.b    $20, $01
                dc.l    HTz_Misc_Mappings                      ; Offset_0x00E5EA
                dc.w    $4000
                dc.b    $08, $01
                dc.l    ($01<<$18)|HTz_Misc_Mappings           ; Offset_0x00E5EA
                dc.w    $4000
                dc.b    $08, $01
                dc.l    Offset_0x00E602
                dc.w    $4428
                dc.b    $04, $04
                dc.l    OOz_Misc_Mappings                      ; Offset_0x00E61A
                dc.w    $4346
                dc.b    $08, $04
                dc.l    ($01<<$18)|OOz_Misc_Mappings           ; Offset_0x00E61A
                dc.w    $4346
                dc.b    $08, $04
                dc.l    ($02<<$18)|OOz_Misc_Mappings           ; Offset_0x00E61A
                dc.w    $4346
                dc.b    $08, $04
                dc.l    ($03<<$18)|OOz_Misc_Mappings           ; Offset_0x00E61A
                dc.w    $4346
                dc.b    $08, $04    
;-------------------------------------------------------------------------------
Offset_0x00E4CE:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsl.w   #$03, D0
                lea     Misc_Object_Definitions_List(PC), A1   ; Offset_0x00E45E
                lea     $00(A1, D0), A1
                move.b  (A1), Obj_Map_Id(A0)                             ; $001A
                move.l  (A1)+, Obj_Map(A0)                               ; $0004
                move.w  (A1)+, Obj_Art_VRAM(A0)                          ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  (A1)+, Obj_Width(A0)                             ; $0019
                move.b  (A1)+, Obj_Priority(A0)                          ; $0018
Offset_0x00E500:
                bra     MarkObjGone                            ; Offset_0x011FBC                                                                                                 
;===============================================================================   
; Objeto 0x1C - Miscelânea de objetos - Suporte das pontes na Emerald Hill,
; <<<-          postes na Hill Top, etc...
;===============================================================================