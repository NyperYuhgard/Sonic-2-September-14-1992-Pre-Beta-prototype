;===============================================================================
; Objeto 0x44 - Mola circular com estrela na Casino Night
; ->>>        
;===============================================================================     
; Offset_0x01A1DC:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01A1EA(PC, D0), D1
                jmp     Offset_0x01A1EA(PC, D1)             
;-------------------------------------------------------------------------------   
Offset_0x01A1EA:
                dc.w    Offset_0x01A1EE-Offset_0x01A1EA
                dc.w    Offset_0x01A21C-Offset_0x01A1EA
;-------------------------------------------------------------------------------
Offset_0x01A1EE:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Red_Ball_Bumper_Mappings, Obj_Map(A0) ; Offset_0x01A304, $0004
                move.w  #$439A, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$D7, Obj_Col_Flags(A0)                          ; $0020
;-------------------------------------------------------------------------------                
Offset_0x01A21C:
                move.b  Obj_Col_Prop(A0), D0                             ; $0021
                beq     Offset_0x01A2E8
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bclr    #$00, Obj_Col_Prop(A0)                           ; $0021
                beq.s   Offset_0x01A232
                bsr.s   Offset_0x01A248
Offset_0x01A232:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bclr    #$01, Obj_Col_Prop(A0)                           ; $0021
                beq.s   Offset_0x01A240
                bsr.s   Offset_0x01A248
Offset_0x01A240:
                clr.b   Obj_Col_Prop(A0)                                 ; $0021
                bra     Offset_0x01A2E8
Offset_0x01A248:
                move.w  Obj_X(A0), D1                                    ; $0008
                move.w  Obj_Y(A0), D2                                    ; $000C
                sub.w   Obj_X(A1), D1                                    ; $0008
                sub.w   Obj_Y(A1), D2                                    ; $000C
                jsr     (CalcAngle)                            ; Offset_0x003C02
                move.b  ($FFFFFE04).w, D1
                andi.w  #$0003, D1
                add.w   D1, D0
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  #$F900, D1
                asr.l   #$08, D1
                move.w  D1, Obj_Speed(A1)                                ; $0010
                muls.w  #$F900, D0
                asr.l   #$08, D0
                move.w  D0, Obj_Speed_Y(A1)                              ; $0012
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$04, Obj_Status(A1)                             ; $0022
                bclr    #$05, Obj_Status(A1)                             ; $0022
                clr.b   Obj_Control_Var_10(A1)                           ; $003C
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$00B4, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x01A2C0
                cmpi.b  #$8A, $02(A2, D0)
                bcc.s   Offset_0x01A2E6
                addq.b  #$01, $02(A2, D0)
Offset_0x01A2C0:
                moveq   #$01, D0
                jsr     (AddPoints)                            ; Offset_0x0394D0
                bsr     SingleObjectLoad                       ; Offset_0x013BAA
                bne.s   Offset_0x01A2E6
                move.b  #$29, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$04, Obj_Map_Id(A1)                             ; $001A
Offset_0x01A2E6:
                rts
Offset_0x01A2E8:
                lea     (Red_Ball_Bumper_Animate_Data), A1     ; Offset_0x01A2F6
                bsr     Jmp_00_To_AnimateSprite                ; Offset_0x01A342
                bra     Jmp_00_To_MarkObjGone                  ; Offset_0x01A33C   
;-------------------------------------------------------------------------------
Red_Ball_Bumper_Animate_Data:                                  ; Offset_0x01A2F6
                dc.w    Offset_0x01A2FA-Red_Ball_Bumper_Animate_Data
                dc.w    Offset_0x01A2FD-Red_Ball_Bumper_Animate_Data
Offset_0x01A2FA:
                dc.b    $0F, $00, $FF
Offset_0x01A2FD:
                dc.b    $03, $01, $00, $01, $FD, $00, $00         
;-------------------------------------------------------------------------------  
Red_Ball_Bumper_Mappings:                                      ; Offset_0x01A304
                dc.w    Offset_0x01A308-Red_Ball_Bumper_Mappings
                dc.w    Offset_0x01A31A-Red_Ball_Bumper_Mappings
Offset_0x01A308:
                dc.w    $0002
                dc.l    $F0070000, $0000FFF0
                dc.l    $F0070800, $08000000
Offset_0x01A31A:
                dc.w    $0004
                dc.l    $EC0B0008, $0004FFE8
                dc.l    $EC0B0808, $08040000
                dc.l    $0C050014, $000AFFF0
                dc.l    $0C050814, $080A0000
;===============================================================================   
; Objeto 0x44 - Mola circular com estrela na Casino Night
; <<<-        
;===============================================================================