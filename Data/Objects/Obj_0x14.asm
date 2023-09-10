;===============================================================================
; Objeto 0x14 - Gangorra na Hill com contrapeso que causa danos se tocado
; ->>>
;===============================================================================  
; Offset_0x01C3D4:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01C3EA(PC, D0), D1
                jsr     Offset_0x01C3EA(PC, D1)
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                bra     Jmp_00_To_MarkObjGone_2                ; Offset_0x01C852                                    
;-------------------------------------------------------------------------------   
Offset_0x01C3EA:
                dc.w    Offset_0x01C3F6-Offset_0x01C3EA
                dc.w    Offset_0x01C464-Offset_0x01C3EA
                dc.w    Offset_0x01C520-Offset_0x01C3EA
                dc.w    Offset_0x01C54E-Offset_0x01C3EA
                dc.w    Offset_0x01C5A8-Offset_0x01C3EA
                dc.w    Offset_0x01C640-Offset_0x01C3EA
;-------------------------------------------------------------------------------  
Offset_0x01C3F6:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Seesaw_Mappings, Obj_Map(A0)   ; Offset_0x01C79C, $0004
                move.w  #$03C6, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_05_To_ModifySpriteAttr_2P          ; Offset_0x01C846
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$30, Obj_Width(A0)                              ; $0019
                move.w  Obj_X(A0), Obj_Control_Var_04(A0)         ; $0008, $0030
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bne.s   Offset_0x01C450
                bsr     Jmp_00_To_SingleObjectLoad_2           ; Offset_0x01C840
                bne.s   Offset_0x01C450
                move.b  #$14, Obj_Id(A1)                                 ; $0000
                addq.b  #$06, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  Obj_Status(A0), Obj_Status(A1)            ; $0022, $0022
                move.l  A0, Obj_Control_Var_10(A1)                       ; $003C
Offset_0x01C450:
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01C45E
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
Offset_0x01C45E:
                move.b  Obj_Map_Id(A0), Obj_Control_Var_0E(A0)    ; $001A, $003A
;-------------------------------------------------------------------------------                  
Offset_0x01C464:
                move.b  Obj_Control_Var_0E(A0), D1                       ; $003A
                btst    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01C4BE
                moveq   #$02, D1
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_X(A1), D0                                    ; $0008
                bcc.s   Offset_0x01C484
                neg.w   D0
                moveq   #$00, D1
Offset_0x01C484:
                cmpi.w  #$0008, D0
                bcc.s   Offset_0x01C48C
                moveq   #$01, D1
Offset_0x01C48C:
                btst    #$04, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01C4F6
                moveq   #$02, D2
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_X(A1), D0                                    ; $0008
                bcc.s   Offset_0x01C4A8
                neg.w   D0
                moveq   #$00, D2
Offset_0x01C4A8:
                cmpi.w  #$0008, D0
                bcc.s   Offset_0x01C4B0
                moveq   #$01, D2
Offset_0x01C4B0:
                add.w   D2, D1
                cmpi.w  #$0003, D1
                bne.s   Offset_0x01C4BA
                addq.w  #$01, D1
Offset_0x01C4BA:
                lsr.w   #$01, D1
                bra.s   Offset_0x01C4F6
Offset_0x01C4BE:
                btst    #$04, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01C4E4
                moveq   #$02, D1
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_X(A1), D0                                    ; $0008
                bcc.s   Offset_0x01C4DA
                neg.w   D0
                moveq   #$00, D1
Offset_0x01C4DA:
                cmpi.w  #$0008, D0
                bcc.s   Offset_0x01C4F6
                moveq   #$01, D1
                bra.s   Offset_0x01C4F6
Offset_0x01C4E4:
                move.w  ($FFFFB012).w, D0
                move.w  ($FFFFB052).w, D2
                cmp.w   D0, D2
                blt.s   Offset_0x01C4F2
                move.w  D2, D0
Offset_0x01C4F2:
                move.w  D0, Obj_Control_Var_0C(A0)                       ; $0038
Offset_0x01C4F6:
                bsr     Offset_0x01C522
                lea     (Offset_0x01C73A), A2
                btst    #$00, Obj_Map_Id(A0)                             ; $001A
                beq.s   Offset_0x01C50E
                lea     (Offset_0x01C76B), A2
Offset_0x01C50E:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                moveq   #$08, D3
                move.w  (A7)+, D4
                bra     Platform_Object_2                      ; Offset_0x014D5A
;-------------------------------------------------------------------------------                  
Offset_0x01C520:
                rts
Offset_0x01C522:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                cmp.b   D1, D0
                beq.s   Offset_0x01C54C
                bcc.s   Offset_0x01C52E
                addq.b  #$02, D0
Offset_0x01C52E:
                subq.b  #$01, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                move.b  D1, Obj_Control_Var_0E(A0)                       ; $003A
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                btst    #$01, Obj_Map_Id(A0)                             ; $001A
                beq.s   Offset_0x01C54C
                bset    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x01C54C:
                rts
;-------------------------------------------------------------------------------                  
Offset_0x01C54E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Seesaw_Badnick_Mappings, Obj_Map(A0) ; Offset_0x01C828, $0004
                move.w  #$03DE, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_05_To_ModifySpriteAttr_2P          ; Offset_0x01C846
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$8B, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$0C, Obj_Width(A0)                              ; $0019
                move.w  Obj_X(A0), Obj_Control_Var_04(A0)         ; $0008, $0030
                addi.w  #$0028, Obj_X(A0)                                ; $0008
                addi.w  #$0010, Obj_Y(A0)                                ; $000C
                move.w  Obj_Y(A0), Obj_Control_Var_08(A0)         ; $000C, $0034
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01C5A8
                subi.w  #$0050, Obj_X(A0)                                ; $0008
                move.b  #$02, Obj_Control_Var_0E(A0)                     ; $003A
;-------------------------------------------------------------------------------                  
Offset_0x01C5A8:
                bsr     Offset_0x01C712
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                moveq   #$00, D0
                move.b  Obj_Control_Var_0E(A0), D0                       ; $003A
                sub.b   Obj_Control_Var_0E(A1), D0                       ; $003A
                beq.s   Offset_0x01C602
                bcc.s   Offset_0x01C5C0
                neg.b   D0
Offset_0x01C5C0:
                move.w  #$F7E8, D1
                move.w  #$FEEC, D2
                cmpi.b  #$01, D0
                beq.s   Offset_0x01C5E6
                move.w  #$F510, D1
                move.w  #$FF34, D2
                cmpi.w  #$0A00, Obj_Control_Var_0C(A1)                   ; $0038
                blt.s   Offset_0x01C5E6
                move.w  #$F200, D1
                move.w  #$FF60, D2
Offset_0x01C5E6:
                move.w  D1, Obj_Speed_Y(A0)                              ; $0012
                move.w  D2, Obj_Speed(A0)                                ; $0010
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_Control_Var_04(A0), D0                       ; $0030
                bcc.s   Offset_0x01C5FC
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x01C5FC:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bra.s   Offset_0x01C640
Offset_0x01C602:
                lea     (Offset_0x01C708), A2
                moveq   #$00, D0
                move.b  Obj_Map_Id(A1), D0                               ; $001A
                move.w  #$0028, D2
                move.w  Obj_X(A0), D1                                    ; $0008
                sub.w   Obj_Control_Var_04(A0), D1                       ; $0030
                bcc.s   Offset_0x01C620
                neg.w   D2
                addq.w  #$02, D0
Offset_0x01C620:
                add.w   D0, D0
                move.w  Obj_Control_Var_08(A0), D1                       ; $0034
                add.w   $00(A2, D0), D1
                move.w  D1, Obj_Y(A0)                                    ; $000C
                add.w   Obj_Control_Var_04(A0), D2                       ; $0030
                move.w  D2, Obj_X(A0)                                    ; $0008
                clr.w   $000E(A0)
                clr.w   Obj_Sub_Y(A0)                                    ; $000A
                rts
Offset_0x01C640:
                bsr     Offset_0x01C712
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bpl.s   Offset_0x01C662
                bsr     Jmp_00_To_ObjectFall                   ; Offset_0x01C84C
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                subi.w  #$002F, D0
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bgt.s   Offset_0x01C660
                bsr     Jmp_00_To_ObjectFall                   ; Offset_0x01C84C
;-------------------------------------------------------------------------------                  
Offset_0x01C660:
                rts
Offset_0x01C662:
                bsr     Jmp_00_To_ObjectFall                   ; Offset_0x01C84C
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                lea     (Offset_0x01C708), A2
                moveq   #$00, D0
                move.b  Obj_Map_Id(A1), D0                               ; $001A
                move.w  Obj_X(A0), D1                                    ; $0008
                sub.w   Obj_Control_Var_04(A0), D1                       ; $0030
                bcc.s   Offset_0x01C682
                addq.w  #$02, D0
Offset_0x01C682:
                add.w   D0, D0
                move.w  Obj_Control_Var_08(A0), D1                       ; $0034
                add.w   $00(A2, D0), D1
                cmp.w   Obj_Y(A0), D1                                    ; $000C
                bgt.s   Offset_0x01C6D6
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                moveq   #$02, D1
                tst.w   Obj_Speed(A0)                                    ; $0010
                bmi.s   Offset_0x01C6A0
                moveq   #$00, D1
Offset_0x01C6A0:
                move.b  D1, Obj_Control_Var_0E(A1)                       ; $003A
                move.b  D1, Obj_Control_Var_0E(A0)                       ; $003A
                cmp.b   Obj_Map_Id(A1), D1                               ; $001A
                beq.s   Offset_0x01C6CA
                lea     (Obj_Memory_Address).w, A2                   ; $FFFFB000
                bclr    #$03, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x01C6BC
                bsr.s   Offset_0x01C6D8
Offset_0x01C6BC:
                lea     (Obj_Memory_Address+$0040).w, A2             ; $FFFFB040
                bclr    #$04, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x01C6CA
                bsr.s   Offset_0x01C6D8
Offset_0x01C6CA:
                clr.w   Obj_Speed(A0)                                    ; $0010
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x01C6D6:
                rts
Offset_0x01C6D8:
                move.w  Obj_Speed_Y(A0), Obj_Speed_Y(A2)          ; $0012, $0012
                neg.w   Obj_Speed_Y(A2)                                  ; $0012
                bset    #$01, Obj_Status(A2)                             ; $0022
                bclr    #$03, Obj_Status(A2)                             ; $0022
                clr.b   Obj_Control_Var_10(A2)                           ; $003C
                move.b  #$10, Obj_Ani_Number(A2)                         ; $001C
                move.b  #$02, Obj_Routine(A2)                            ; $0024
                move.w  #$00CC, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912   
;-------------------------------------------------------------------------------
Offset_0x01C708:
                dc.w    $FFF8, $FFE4, $FFD1, $FFE4, $FFF8     
;-------------------------------------------------------------------------------
Offset_0x01C712:
                move.b  ($FFFFFE05).w, D0
                andi.b  #$03, D0
                bne.s   Offset_0x01C722
                bchg    #05, Obj_Art_VRAM(A0)                            ; $0002
Offset_0x01C722:
                andi.b  #$FE, Obj_Flags(A0)                              ; $0001
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                sub.w   Obj_X(A0), D0                                    ; $0008
                bcs.s   Offset_0x01C738
                ori.b   #$01, Obj_Flags(A0)                              ; $0001
Offset_0x01C738:
                rts       
;-------------------------------------------------------------------------------  
Offset_0x01C73A:
                dc.b    $14, $14, $16, $18, $1A, $1C, $1A, $18
                dc.b    $16, $14, $13, $12, $11, $10, $0F, $0E
                dc.b    $0D, $0C, $0B, $0A, $09, $08, $07, $06
                dc.b    $05, $04, $03, $02, $01, $00, $FF, $FE
                dc.b    $FD, $FC, $FB, $FA, $F9, $F8, $F7, $F6
                dc.b    $F5, $F4, $F3, $F2, $F2, $F2, $F2, $F2
                dc.b    $F2 
;------------------------------------------------------------------------------- 
Offset_0x01C76B:
                dc.b    $05, $05, $05, $05, $05, $05, $05, $05
                dc.b    $05, $05, $05, $05, $05, $05, $05, $05
                dc.b    $05, $05, $05, $05, $05, $05, $05, $05
                dc.b    $05, $05, $05, $05, $05, $05, $05, $05
                dc.b    $05, $05, $05, $05, $05, $05, $05, $05
                dc.b    $05, $05, $05, $05, $05, $05, $05, $05
                dc.b    $00
;-------------------------------------------------------------------------------
Seesaw_Mappings:                                               ; Offset_0x01C79C
                dc.w    Offset_0x01C7A4-Seesaw_Mappings
                dc.w    Offset_0x01C7E6-Seesaw_Mappings
                dc.w    Offset_0x01C7A4-Seesaw_Mappings
                dc.w    Offset_0x01C7E6-Seesaw_Mappings
Offset_0x01C7A4:
                dc.w    $0008
                dc.l    $FC054014, $400AFFF8
                dc.l    $0C012012, $2009FFFC
                dc.l    $E4054006, $4003FFD0
                dc.l    $EC05400A, $4005FFE0
                dc.l    $F405400A, $4005FFF0
                dc.l    $FC05400A, $40050000
                dc.l    $0405400A, $40050010
                dc.l    $0C05400E, $40070020
Offset_0x01C7E6:
                dc.w    $0008
                dc.l    $FC054014, $400AFFF8
                dc.l    $0C012012, $2009FFFC
                dc.l    $F4054000, $4000FFD0
                dc.l    $F4054002, $4001FFE0
                dc.l    $F4054002, $4001FFF0
                dc.l    $F4054002, $40010000
                dc.l    $F4054002, $40010010
                dc.l    $F4054800, $48000020    
;-------------------------------------------------------------------------------  
Seesaw_Badnick_Mappings:                                       ; Offset_0x01C828
                dc.w    Offset_0x01C82C-Seesaw_Badnick_Mappings
                dc.w    Offset_0x01C836-Seesaw_Badnick_Mappings
Offset_0x01C82C:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x01C836:
                dc.w    $0001
                dc.l    $F8052000, $2000FFF8                                                                                             
;===============================================================================   
; Objeto 0x14 - Gangorra na Hill com contrapeso que causa danos se tocado
; <<<-
;===============================================================================