;===============================================================================
; Objeto 0x20 - Bolas de fogo usadas pelo Robotnik na Hill Top
; ->>> 
;===============================================================================
Offset_0x01DA68:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01DA76(PC, D0), D1
                jmp     Offset_0x01DA76(PC, D1)     
;-------------------------------------------------------------------------------
Offset_0x01DA76:
                dc.w    Offset_0x01DA84-Offset_0x01DA76
                dc.w    Offset_0x01DAE6-Offset_0x01DA76
                dc.w    Offset_0x01DAF4-Offset_0x01DA76
                dc.w    Offset_0x01DB8E-Offset_0x01DA76
                dc.w    Offset_0x01DBB4-Offset_0x01DA76
                dc.w    Offset_0x01DC42-Offset_0x01DA76
                dc.w    Offset_0x01DCA2-Offset_0x01DA76   
;-------------------------------------------------------------------------------
Offset_0x01DA84:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$08, Obj_Height_2(A0)                           ; $0016
                move.b  #$08, Obj_Width_2(A0)                            ; $0017
                move.l  #Lava_Bubble_Mappings, Obj_Map(A0) ; Offset_0x01DCC4, $0004
                move.w  #$8416, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_09_To_ModifySpriteAttr_2P          ; Offset_0x01DD64
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.w  Obj_Y(A0), Obj_Control_Var_04(A0)         ; $000C, $0030
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsl.w   #$03, D0
                andi.w  #$0780, D0
                neg.w   D0
                move.w  D0, Obj_Speed(A0)                                ; $0010
                move.w  D0, Obj_Speed_Y(A0)                              ; $0012
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$000F, D0
                lsl.w   #$04, D0
                move.w  D0, Obj_Control_Var_06(A0)                       ; $0032
                move.w  D0, Obj_Control_Var_08(A0)                       ; $0034
;-------------------------------------------------------------------------------                
Offset_0x01DAE6:
                lea     (Fireball_Animate_Data), A1            ; Offset_0x01DCA6
                bsr     Jmp_01_To_AnimateSprite                ; Offset_0x01DD5E
                bra     Jmp_06_To_MarkObjGone                  ; Offset_0x01DD52
;-------------------------------------------------------------------------------                
Offset_0x01DAF4:
                cmpi.b  #$05, Obj_Ani_Time(A0)                           ; $001E
                bne.s   Offset_0x01DB24
                bsr     Jmp_03_To_SingleObjectLoad_2           ; Offset_0x01DD58
                bne.s   Offset_0x01DB16
                bsr.s   Offset_0x01DB32
                bsr     Jmp_03_To_SingleObjectLoad_2           ; Offset_0x01DD58
                bne.s   Offset_0x01DB16
                bsr.s   Offset_0x01DB32
                neg.w   Obj_Speed(A1)                                    ; $0010
                bset    #$00, Obj_Flags(A1)                              ; $0001
Offset_0x01DB16:
                move.w  #$00AE, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x01DB24:
                lea     (Fireball_Animate_Data), A1            ; Offset_0x01DCA6
                bsr     Jmp_01_To_AnimateSprite                ; Offset_0x01DD5E
                bra     Jmp_06_To_MarkObjGone                  ; Offset_0x01DD52
Offset_0x01DB32:
                move.b  #$20, Obj_Id(A1)                                 ; $0000
                move.b  #$08, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  Obj_Speed(A0), Obj_Speed(A1)              ; $0010, $0010
                move.w  Obj_Speed_Y(A0), Obj_Speed_Y(A1)          ; $0012, $0012
                move.b  #$08, Obj_Height_2(A1)                           ; $0016
                move.b  #$08, Obj_Width_2(A1)                            ; $0017
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.b  #$08, Obj_Width(A1)                              ; $0019
                move.b  #$8B, Obj_Col_Flags(A1)                          ; $0020
                move.w  Obj_Y(A1), Obj_Control_Var_04(A1)         ; $000C, $0030
                rts
;-------------------------------------------------------------------------------                
Offset_0x01DB8E:
                subq.w  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bpl.s   Offset_0x01DBA6
                move.w  Obj_Control_Var_08(A0), Obj_Control_Var_06(A0); $0032, $0034
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0001, Obj_Ani_Number(A0)                       ; $001C
Offset_0x01DBA6:
                lea     (Fireball_Animate_Data), A1            ; Offset_0x01DCA6
                bsr     Jmp_01_To_AnimateSprite                ; Offset_0x01DD5E
                bra     Jmp_06_To_MarkObjGone                  ; Offset_0x01DD52
;-------------------------------------------------------------------------------                
Offset_0x01DBB4:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x01DBCA
                move.b  #$07, Obj_Ani_Time(A0)                           ; $001E
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                andi.b  #$01, Obj_Map_Id(A0)                             ; $001A
Offset_0x01DBCA:
                bsr     Jmp_05_To_SpeedToPos                   ; Offset_0x01DD6A
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                move.w  (Sonic_Level_Limits_Max_Y).w, D0             ; $FFFFEECE
                addi.w  #$00E0, D0
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bcc.s   Offset_0x01DBE6
                bra     Jmp_07_To_DeleteObject                 ; Offset_0x01DD4C
Offset_0x01DBE6:
                bclr    #$01, Obj_Flags(A0)                              ; $0001
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x01DC3E
                bset    #$01, Obj_Flags(A0)                              ; $0001
                bsr     ObjHitFloor                            ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x01DC3E
                add.w   D1, Obj_Y(A0)                                    ; $000C
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.l  #Fireball_Mappings, Obj_Map(A0) ; Offset_0x01DD04, $0004
                move.w  #$839E, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_09_To_ModifySpriteAttr_2P          ; Offset_0x01DD64
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                move.w  #$0009, Obj_Control_Var_06(A0)                   ; $0032
                move.b  #$03, Obj_Control_Var_0A(A0)                     ; $0036
Offset_0x01DC3E:
                bra     Jmp_06_To_MarkObjGone                  ; Offset_0x01DD52
;-------------------------------------------------------------------------------                
Offset_0x01DC42:
                subq.w  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bpl.s   Offset_0x01DC94
                move.w  #$007F, Obj_Control_Var_06(A0)                   ; $0032
                subq.b  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                bmi.s   Offset_0x01DC94
                bsr     Jmp_03_To_SingleObjectLoad_2           ; Offset_0x01DD58
                bne.s   Offset_0x01DC94
                moveq   #$00, D0
                move.w  #$000F, D1
Offset_0x01DC60:
                move.l  $00(A0, D0), $00(A1, D0)
                addq.w  #$04, D0
                dbra    D1, Offset_0x01DC60
                move.w  #$0009, Obj_Control_Var_06(A1)                   ; $0032
                move.w  #$0200, Obj_Ani_Number(A1)                       ; $001C
                move.w  #$000E, D0
                tst.w   Obj_Speed(A1)                                    ; $0010
                bpl.s   Offset_0x01DC84
                neg.w   D0
Offset_0x01DC84:
                add.w   D0, Obj_X(A1)                                    ; $0008
                move.l  A1, -(A7)
                bsr     Fire_FindFloor                         ; Offset_0x019BAA
                move.l  (A7)+, A1
                add.w   D1, Obj_Y(A1)                                    ; $000C
Offset_0x01DC94:
                lea     (Fireball_Animate_Data), A1            ; Offset_0x01DCA6
                bsr     Jmp_01_To_AnimateSprite                ; Offset_0x01DD5E
                bra     Jmp_06_To_MarkObjGone                  ; Offset_0x01DD52
;-------------------------------------------------------------------------------                
Offset_0x01DCA2:
                bra     Jmp_07_To_DeleteObject                 ; Offset_0x01DD4C
;-------------------------------------------------------------------------------
Fireball_Animate_Data:                                         ; Offset_0x01DCA6
                dc.w    Offset_0x01DCAC-Fireball_Animate_Data
                dc.w    Offset_0x01DCB3-Fireball_Animate_Data
                dc.w    Offset_0x01DCB6-Fireball_Animate_Data
Offset_0x01DCAC:
                dc.b    $0B, $02, $03, $FC, $04, $FD, $01
Offset_0x01DCB3:
                dc.b    $7F, $05, $FF
Offset_0x01DCB6:
                dc.b    $05, $04, $05, $02, $03, $00, $01, $00
                dc.b    $01, $02, $03, $04, $05, $FC            
;-------------------------------------------------------------------------------
Lava_Bubble_Mappings:                                          ; Offset_0x01DCC4
                dc.w    Offset_0x01DCD0-Lava_Bubble_Mappings
                dc.w    Offset_0x01DCDA-Lava_Bubble_Mappings
                dc.w    Offset_0x01DCE4-Lava_Bubble_Mappings
                dc.w    Offset_0x01DCEE-Lava_Bubble_Mappings
                dc.w    Offset_0x01DCF8-Lava_Bubble_Mappings
                dc.w    Offset_0x01DD02-Lava_Bubble_Mappings
Offset_0x01DCD0:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x01DCDA:
                dc.w    $0001
                dc.l    $F8050004, $0002FFF8
Offset_0x01DCE4:
                dc.w    $0001
                dc.l    $F9050008, $0004FFF8
Offset_0x01DCEE:
                dc.w    $0001
                dc.l    $F6050008, $0004FFF8
Offset_0x01DCF8:
                dc.w    $0001
                dc.l    $F605000C, $0006FFF8
Offset_0x01DD02:
                dc.w    $0000     
;-------------------------------------------------------------------------------
Fireball_Mappings:                                             ; Offset_0x01DD04
                dc.w    Offset_0x01DD10-Fireball_Mappings
                dc.w    Offset_0x01DD1A-Fireball_Mappings
                dc.w    Offset_0x01DD24-Fireball_Mappings
                dc.w    Offset_0x01DD2E-Fireball_Mappings
                dc.w    Offset_0x01DD38-Fireball_Mappings
                dc.w    Offset_0x01DD42-Fireball_Mappings
Offset_0x01DD10:
                dc.w    $0001
                dc.l    $F0070000, $0000FFF8
Offset_0x01DD1A:
                dc.w    $0001
                dc.l    $F0070800, $0800FFF8
Offset_0x01DD24:
                dc.w    $0001
                dc.l    $F0070008, $0004FFF8
Offset_0x01DD2E:
                dc.w    $0001
                dc.l    $F0070808, $0804FFF8
Offset_0x01DD38:
                dc.w    $0001
                dc.l    $00050010, $0008FFF8
Offset_0x01DD42:
                dc.w    $0001
                dc.l    $00050810, $0808FFF8                       
;===============================================================================
; Objeto 0x20 - Bolas de fogo usadas pelo Robotnik na Hill Top
; <<<- 
;===============================================================================