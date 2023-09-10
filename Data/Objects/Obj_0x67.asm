;===============================================================================
; Objeto 0x67 - Atributo dos teletransportes na Metropolis
; ->>>
;===============================================================================
; Offset_0x021B5C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x021B84(PC, D0), D1
                jsr     Offset_0x021B84(PC, D1)
                move.b  Obj_Control_Var_00(A0), D0                       ; $002C
                add.b   Obj_Control_Var_0A(A0), D0                       ; $0036
                beq     Jmp_05_To_MarkObjGone_3                ; Offset_0x021F8C
                lea     (Teleport_Animate_Data), A1            ; Offset_0x021F2E
                bsr     Jmp_04_To_AnimateSprite                ; Offset_0x021F86
                bra     Jmp_0D_To_DisplaySprite                ; Offset_0x021F80
;-------------------------------------------------------------------------------
Offset_0x021B84:
                dc.w    Offset_0x021B88-Offset_0x021B84
                dc.w    Offset_0x021BAC-Offset_0x021B84
;-------------------------------------------------------------------------------  
Offset_0x021B88:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Teleport_Mappings, Obj_Map(A0) ; Offset_0x021F48, $0004
                move.w  #$656B, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$05, Obj_Priority(A0)                           ; $0018
;-------------------------------------------------------------------------------                  
Offset_0x021BAC:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                lea     Obj_Control_Var_00(A0), A4                       ; $002C
                bsr.s   Offset_0x021BBE
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                lea     Obj_Control_Var_0A(A0), A4                       ; $0036
Offset_0x021BBE:
                moveq   #$00, D0
                move.b  (A4), D0
                move.w  Offset_0x021BCA(PC, D0), D0
                jmp     Offset_0x021BCA(PC, D0)       
;-------------------------------------------------------------------------------    
Offset_0x021BCA:
                dc.w    Offset_0x021BD0-Offset_0x021BCA
                dc.w    Offset_0x021C60-Offset_0x021BCA
                dc.w    Offset_0x021C94-Offset_0x021BCA
;------------------------------------------------------------------------------- 
Offset_0x021BD0:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne     Offset_0x021C5E
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                addq.w  #$03, D0
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x021BEE
                addi.w  #$000A, D0
Offset_0x021BEE:
                cmpi.w  #$0010, D0
                bcc.s   Offset_0x021C5E
                move.w  Obj_Y(A1), D1                                    ; $000C
                sub.w   Obj_Y(A0), D1                                    ; $000C
                addi.w  #$0020, D1
                cmpi.w  #$0040, D1
                bcc.s   Offset_0x021C5E
                tst.b   Obj_Timer(A1)                                    ; $002A
                bne.s   Offset_0x021C5E
                addq.b  #$02, (A4)
                move.b  #$81, Obj_Timer(A1)                              ; $002A
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                move.w  #$0800, Obj_Inertia(A1)                          ; $0014
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
                bclr    #$05, Obj_Status(A0)                             ; $0022
                bclr    #$05, Obj_Status(A1)                             ; $0022
                bset    #$01, Obj_Status(A1)                             ; $0022
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                clr.b   $0001(A4) 
                move.w  #$00BE, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                move.w  #$0100, Obj_Ani_Number(A0)                       ; $001C
Offset_0x021C5E:
                rts
;-------------------------------------------------------------------------------                 
Offset_0x021C60:
                move.b  $0001(A4), D0  
                addq.b  #$02, $0001(A4)
                jsr     (CalcSine)                             ; Offset_0x00396A
                asr.w   #$05, D0
                move.w  Obj_Y(A0), D2                                    ; $000C
                sub.w   D0, D2
                move.w  D2, Obj_Y(A1)                                    ; $000C
                cmpi.b  #$80, $0001(A4)
                bne.s   Offset_0x021C92
                bsr     Offset_0x021D10
                addq.b  #$02, (A4)
                move.w  #$00BC, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x021C92:
                rts
;-------------------------------------------------------------------------------                 
Offset_0x021C94:
                subq.b  #$01, $0002(A4) 
                bpl.s   Offset_0x021CC8
                move.l  $0006(A4), A2
                move.w  (A2)+, D4
                move.w  D4, Obj_X(A1)                                    ; $0008
                move.w  (A2)+, D5
                move.w  D5, Obj_Y(A1)                                    ; $000C
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bpl.s   Offset_0x021CB2
                subq.w  #$08, A2
Offset_0x021CB2:
                move.l  A2, $0006(A4)
                subq.w  #$04, $0004(A4)
                beq.s   Offset_0x021CEE
                move.w  (A2)+, D4
                move.w  (A2)+, D5
                move.w  #$1000, D2
                bra     Offset_0x021D74
Offset_0x021CC8:
                move.l  Obj_X(A1), D2                                    ; $0008
                move.l  Obj_Y(A1), D3                                    ; $000C
                move.w  Obj_Speed(A1), D0                                ; $0010
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  Obj_Speed_Y(A1), D0                              ; $0012
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D2, Obj_X(A1)                                    ; $0008
                move.l  D3, Obj_Y(A1)                                    ; $000C
                rts
Offset_0x021CEE:
                andi.w  #$07FF, Obj_Y(A1)                                ; $000C
                clr.b   (A4)
                clr.b   Obj_Timer(A1)                                    ; $002A
                btst    #$04, Obj_Subtype(A0)                            ; $0028
                bne.s   Offset_0x021D0E
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
Offset_0x021D0E:
                rts
Offset_0x021D10:
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl.s   Offset_0x021D44
                neg.b   D0
                andi.w  #$000F, D0
                add.w   D0, D0
                lea     (Teleport_From_To_Data), A2            ; Offset_0x021DF2
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D0
                subq.w  #$04, D0
                move.w  D0, $0004(A4)                                  ; $0004
                lea     $00(A2, D0), A2
                move.w  (A2)+, D4
                move.w  D4, Obj_X(A1)                                    ; $0008
                move.w  (A2)+, D5
                move.w  D5, Obj_Y(A1)                                    ; $000C
                subq.w  #$08, A2
                bra.s   Offset_0x021D68
Offset_0x021D44:
                andi.w  #$000F, D0
                add.w   D0, D0
                lea     (Teleport_From_To_Data), A2            ; Offset_0x021DF2
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, $0004(A4)
                subq.w  #$04, $0004(A4)
                move.w  (A2)+, D4
                move.w  D4, Obj_X(A1)                                    ; $0008
                move.w  (A2)+, D5
                move.w  D5, Obj_Y(A1)                                    ; $000C
Offset_0x021D68:
                move.l  A2, $0006(A4)
                move.w  (A2)+, D4
                move.w  (A2)+, D5
                move.w  #$1000, D2
Offset_0x021D74:
                moveq   #$00, D0
                move.w  D2, D3
                move.w  D4, D0
                sub.w   Obj_X(A1), D0                                    ; $0008
                bge.s   Offset_0x021D84
                neg.w   D0
                neg.w   D2
Offset_0x021D84:
                moveq   #$00, D1
                move.w  D5, D1
                sub.w   Obj_Y(A1), D1                                    ; $000C
                bge.s   Offset_0x021D92
                neg.w   D1
                neg.w   D3
Offset_0x021D92:
                cmp.w   D0, D1
                bcs.s   Offset_0x021DC4
                moveq   #$00, D1
                move.w  D5, D1
                sub.w   Obj_Y(A1), D1                                    ; $000C
                swap.w  D1
                divs.w  D3, D1
                moveq   #$00, D0
                move.w  D4, D0
                sub.w   Obj_X(A1), D0                                    ; $0008
                beq.s   Offset_0x021DB0
                swap.w  D0
                divs.w  D1, D0
Offset_0x021DB0:
                move.w  D0, Obj_Speed(A1)                                ; $0010
                move.w  D3, Obj_Speed_Y(A1)                              ; $0012
                tst.w   D1
                bpl.s   Offset_0x021DBE
                neg.w   D1
Offset_0x021DBE:
                move.w  D1, $0002(A4) 
                rts
Offset_0x021DC4:
                moveq   #$00, D0
                move.w  D4, D0
                sub.w   Obj_X(A1), D0                                    ; $0008
                swap.w  D0
                divs.w  D2, D0
                moveq   #$00, D1
                move.w  D5, D1
                sub.w   Obj_Y(A1), D1                                    ; $000C
                beq.s   Offset_0x021DDE
                swap.w  D1
                divs.w  D0, D1
Offset_0x021DDE:
                move.w  D1, Obj_Speed_Y(A1)                              ; $0012
                move.w  D2, Obj_Speed(A1)                                ; $0010
                tst.w   D0
                bpl.s   Offset_0x021DEC
                neg.w   D0
Offset_0x021DEC:
                move.w  D0, $0002(A4)
                rts    
;-------------------------------------------------------------------------------
Teleport_From_To_Data:                                         ; Offset_0x021DF2
                dc.w    Offset_0x021E0C-Teleport_From_To_Data
                dc.w    Offset_0x021E26-Teleport_From_To_Data
                dc.w    Offset_0x021E30-Teleport_From_To_Data
                dc.w    Offset_0x021E4A-Teleport_From_To_Data
                dc.w    Offset_0x021E54-Teleport_From_To_Data
                dc.w    Offset_0x021E5E-Teleport_From_To_Data
                dc.w    Offset_0x021E78-Teleport_From_To_Data
                dc.w    Offset_0x021E92-Teleport_From_To_Data
                dc.w    Offset_0x021EAC-Teleport_From_To_Data
                dc.w    Offset_0x021EC6-Teleport_From_To_Data
                dc.w    Offset_0x021EE0-Teleport_From_To_Data
                dc.w    Offset_0x021EFA-Teleport_From_To_Data
                dc.w    Offset_0x021F14-Teleport_From_To_Data
Offset_0x021E0C:
                dc.w    $0018
                dc.w    $07A8, $0270, $0750, $0270
                dc.w    $0740, $0280, $0740, $03E0
                dc.w    $0750, $03F0, $07A8, $03F0
Offset_0x021E26:
                dc.w    $0008
                dc.w    $0C58, $05F0, $0E28, $05F0
Offset_0x021E30:
                dc.w    $0018
                dc.w    $1828, $06B0, $17D0, $06B0
                dc.w    $17C0, $06C0, $17C0, $07E0
                dc.w    $17B0, $07F0, $1758, $07F0
Offset_0x021E4A:
                dc.w    $0008
                dc.w    $05D8, $0370, $0780, $0370
Offset_0x021E54:
                dc.w    $0008
                dc.w    $05D8, $05F0, $0700, $05F0
Offset_0x021E5E:
                dc.w    $0018
                dc.w    $0BD8, $01F0, $0C30, $01F0
                dc.w    $0C40, $01E0, $0C40, $00C0
                dc.w    $0C50, $00B0, $0CA8, $00B0

Offset_0x021E78:
                dc.w    $0018
                dc.w    $1728, $0330, $15D0, $0330
                dc.w    $15C0, $0320, $15C0, $0240
                dc.w    $15D0, $0230, $1628, $0230
Offset_0x021E92:
                dc.w    $0018
                dc.w    $06D8, $01F0, $0730, $01F0
                dc.w    $0740, $01E0, $0740, $0100
                dc.w    $0750, $00F0, $07A8, $00F0
Offset_0x021EAC:
                dc.w    $0018
                dc.w    $07D8, $0330, $0828, $0330
                dc.w    $0840, $0340, $0840, $0458
                dc.w    $0828, $0470, $07D8, $0470
Offset_0x021EC6:
                dc.w    $0018
                dc.w    $0FD8, $03B0, $1028, $03B0
                dc.w    $1040, $0398, $1040, $02C4
                dc.w    $1058, $02B0, $10A8, $02B0
Offset_0x021EE0:
                dc.w    $0018
                dc.w    $0FD8, $04B0, $1028, $04B0
                dc.w    $1040, $04C0, $1040, $05D8
                dc.w    $1058, $05F0, $10A8, $05F0
Offset_0x021EFA:
                dc.w    $0018
                dc.w    $2058, $0430, $20A8, $0430
                dc.w    $20C0, $0418, $20C0, $02C0
                dc.w    $20D0, $02B0, $2128, $02B0
Offset_0x021F14:
                dc.w    $0018
                dc.w    $2328, $05B0, $22D0, $05B0
                dc.w    $22C0, $05A0, $22C0, $04C0
                dc.w    $22D0, $04B0, $2328, $04B0
;-------------------------------------------------------------------------------
Teleport_Animate_Data:                                         ; Offset_0x021F2E
                dc.w    Offset_0x021F32-Teleport_Animate_Data
                dc.w    Offset_0x021F35-Teleport_Animate_Data
Offset_0x021F32:
                dc.b    $1F, $00, $FF
Offset_0x021F35:
                dc.b    $01, $01, $00, $00, $00, $00, $00, $01
                dc.b    $00, $00, $00, $01, $00, $00, $01, $00
                dc.b    $FE, $02, $00   
;-------------------------------------------------------------------------------
Teleport_Mappings:                                             ; Offset_0x021F48
                dc.w    Offset_0x021F4C-Teleport_Mappings
                dc.w    Offset_0x021F4E-Teleport_Mappings
Offset_0x021F4C:
                dc.w    $0000
Offset_0x021F4E:
                dc.w    $0006
                dc.l    $E0050000, $0000FFEC
                dc.l    $E0050000, $0000FFF8
                dc.l    $F0050000, $0000FFEC
                dc.l    $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFEC
                dc.l    $00050000, $0000FFF8                                                                                              
;===============================================================================
; Objeto 0x67 - Atributo dos teletransportes na Metropolis
; <<<-
;===============================================================================