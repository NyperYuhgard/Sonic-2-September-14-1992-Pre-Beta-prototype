;===============================================================================
; Objeto 0x19 - Platformas rotatórias - Sky Fortress / Oil Ocean...
; ->>>
;===============================================================================
; Offset_0x01CA90:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01CA9E(PC, D0), D1
                jmp     Offset_0x01CA9E(PC, D1)                   
;-------------------------------------------------------------------------------
Offset_0x01CA9E:
                dc.w    Offset_0x01CAAA-Offset_0x01CA9E
                dc.w    Offset_0x01CB30-Offset_0x01CA9E       
;-------------------------------------------------------------------------------    
Offset_0x01CAA2:
                dc.b    $20, $00, $18, $01, $40, $02, $20, $03
;-------------------------------------------------------------------------------  
Offset_0x01CAAA:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Rotating_Platforms_Mappings, Obj_Map(A0) ; Offset_0x01CCA2, $0004
                move.w  #$63A0, Obj_Art_VRAM(A0)                         ; $0002
                cmpi.b  #$0A, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x01CACA
                move.w  #$62F4, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x01CACA:
                cmpi.b  #$06, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x01CAD8
                move.w  #$A46D, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x01CAD8:
                bsr     Jmp_07_To_ModifySpriteAttr_2P          ; Offset_0x01CD10
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsr.w   #$03, D0
                andi.w  #$001E, D0
                lea     Offset_0x01CAA2(PC, D0), A2
                move.b  (A2)+, Obj_Width(A0)                             ; $0019
                move.b  (A2)+, Obj_Map_Id(A0)                            ; $001A
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.w  Obj_X(A0), Obj_Control_Var_04(A0)         ; $0008, $0030
                move.w  Obj_Y(A0), Obj_Control_Var_06(A0)         ; $000C, $0032
                andi.b  #$0F, Obj_Subtype(A0)                            ; $0028
                cmpi.b  #$03, Obj_Subtype(A0)                            ; $0028
                bne.s   Offset_0x01CB22
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x01CB2A
Offset_0x01CB22:
                cmpi.b  #$07, Obj_Subtype(A0)                            ; $0028
                bne.s   Offset_0x01CB30
Offset_0x01CB2A:
                subi.w  #$00C0, Obj_Y(A0)                                ; $000C
;-------------------------------------------------------------------------------                   
Offset_0x01CB30:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Offset_0x01CB60
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                move.w  #$0011, D3
                move.w  (A7)+, D4
                bsr     Platform_Object                        ; Offset_0x014D02
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Jmp_06_To_DeleteObject                 ; Offset_0x01CD0A
                bra     Jmp_05_To_DisplaySprite                ; Offset_0x01CD04
Offset_0x01CB60:
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$000F, D0
                add.w   D0, D0
                move.w  Offset_0x01CB74(PC, D0), D1
                jmp     Offset_0x01CB74(PC, D1)       
;-------------------------------------------------------------------------------   
Offset_0x01CB74:
                dc.w    Offset_0x01CB94-Offset_0x01CB74
                dc.w    Offset_0x01CB9E-Offset_0x01CB74
                dc.w    Offset_0x01CBBE-Offset_0x01CB74
                dc.w    Offset_0x01CBDE-Offset_0x01CB74
                dc.w    Offset_0x01CBEE-Offset_0x01CB74
                dc.w    Offset_0x01CC0E-Offset_0x01CB74
                dc.w    Offset_0x01CC10-Offset_0x01CB74
                dc.w    Offset_0x01CC10-Offset_0x01CB74
                dc.w    Offset_0x01CC2C-Offset_0x01CB74
                dc.w    Offset_0x01CC2C-Offset_0x01CB74
                dc.w    Offset_0x01CC2C-Offset_0x01CB74
                dc.w    Offset_0x01CC2C-Offset_0x01CB74
                dc.w    Offset_0x01CC66-Offset_0x01CB74
                dc.w    Offset_0x01CC66-Offset_0x01CB74
                dc.w    Offset_0x01CC66-Offset_0x01CB74
                dc.w    Offset_0x01CC66-Offset_0x01CB74
;------------------------------------------------------------------------------- 
Offset_0x01CB94:
                move.b  ($FFFFFE68).w, D0
                move.w  #$0040, D1
                bra.s   Offset_0x01CBA6
;-------------------------------------------------------------------------------                 
Offset_0x01CB9E:
                move.b  ($FFFFFE6C).w, D0
                move.w  #$0060, D1
Offset_0x01CBA6:
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01CBB2
                neg.w   D0
                add.w   D1, D0
Offset_0x01CBB2:
                move.w  Obj_Control_Var_04(A0), D1                       ; $0030
                sub.w   D0, D1
                move.w  D1, Obj_X(A0)                                    ; $0008
                rts
;-------------------------------------------------------------------------------                 
Offset_0x01CBBE:
                move.b  ($FFFFFE7C).w, D0
                move.w  #$0080, D1
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01CBD2
                neg.w   D0
                add.w   D1, D0
Offset_0x01CBD2:
                move.w  Obj_Control_Var_06(A0), D1                       ; $0032
                sub.w   D0, D1
                move.w  D1, Obj_Y(A0)                                    ; $000C
                rts
;-------------------------------------------------------------------------------                 
Offset_0x01CBDE:
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq.s   Offset_0x01CBEC
                addq.b  #$01, Obj_Subtype(A0)                            ; $0028
Offset_0x01CBEC:
                rts
;-------------------------------------------------------------------------------                 
Offset_0x01CBEE:
                bsr     Jmp_03_To_SpeedToPos                   ; Offset_0x01CD16
                moveq   #$08, D1
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                subi.w  #$0060, D0
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bcc.s   Offset_0x01CC04
                neg.w   D1
Offset_0x01CC04:
                add.w   D1, Obj_Speed_Y(A0)                              ; $0012
                bne.s   Offset_0x01CC0E
                addq.b  #$01, Obj_Subtype(A0)                            ; $0028
;-------------------------------------------------------------------------------                 
Offset_0x01CC0E:
                rts
;-------------------------------------------------------------------------------                 
Offset_0x01CC10:
                bsr     Jmp_03_To_SpeedToPos                   ; Offset_0x01CD16
                moveq   #$08, D1
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                subi.w  #$0060, D0
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bcc.s   Offset_0x01CC26
                neg.w   D1
Offset_0x01CC26:
                add.w   D1, Obj_Speed_Y(A0)                              ; $0012
                rts
;-------------------------------------------------------------------------------                 
Offset_0x01CC2C:
                move.b  ($FFFFFE98).w, D1
                subi.b  #$40, D1
                ext.w   D1
                move.b  ($FFFFFE9C).w, D2
                subi.b  #$40, D2
                ext.w   D2
                btst    #$02, D0
                beq.s   Offset_0x01CC4A
                neg.w   D1
                neg.w   D2
Offset_0x01CC4A:
                btst    #$01, D0
                beq.s   Offset_0x01CC54
                neg.w   D1
                exg.l   D1, D2
Offset_0x01CC54:
                add.w   Obj_Control_Var_04(A0), D1                       ; $0030
                move.w  D1, Obj_X(A0)                                    ; $0008
                add.w   Obj_Control_Var_06(A0), D2                       ; $0032
                move.w  D2, Obj_Y(A0)                                    ; $000C
                rts
;-------------------------------------------------------------------------------                 
Offset_0x01CC66:
                move.b  ($FFFFFE98).w, D1
                subi.b  #$40, D1
                ext.w   D1
                move.b  ($FFFFFE9C).w, D2
                subi.b  #$40, D2
                ext.w   D2
                btst    #$02, D0
                beq.s   Offset_0x01CC84
                neg.w   D1
                neg.w   D2
Offset_0x01CC84:
                btst    #$01, D0
                beq.s   Offset_0x01CC8E
                neg.w   D1
                exg.l   D1, D2
Offset_0x01CC8E:
                neg.w   D1
                add.w   Obj_Control_Var_04(A0), D1                       ; $0030
                move.w  D1, Obj_X(A0)                                    ; $0008
                add.w   Obj_Control_Var_06(A0), D2                       ; $0032
                move.w  D2, Obj_Y(A0)                                    ; $000C
                rts
;-------------------------------------------------------------------------------
Rotating_Platforms_Mappings:                                   ; Offset_0x01CCA2
                dc.w    Offset_0x01CCAA-Rotating_Platforms_Mappings
                dc.w    Offset_0x01CCBC-Rotating_Platforms_Mappings
                dc.w    Offset_0x01CCCE-Rotating_Platforms_Mappings
                dc.w    Offset_0x01CCF0-Rotating_Platforms_Mappings
Offset_0x01CCAA:
                dc.w    $0002
                dc.l    $F00F0000, $0000FFE0
                dc.l    $F00F0800, $08000000
Offset_0x01CCBC:
                dc.w    $0002
                dc.l    $F00B0000, $0000FFE8
                dc.l    $F00B0800, $08000000
Offset_0x01CCCE:
                dc.w    $0004
                dc.l    $F00E0000, $0000FFC0
                dc.l    $F00E000C, $0006FFE0
                dc.l    $F00E080C, $08060000
                dc.l    $F00E0800, $08000020
Offset_0x01CCF0:
                dc.w    $0002
                dc.l    $F00E0000, $0000FFE0
                dc.l    $F00E0800, $08000000                                             
;===============================================================================
; Objeto 0x19 - Platformas rotatórias - Sky Fortress / Oil Ocean...
; <<<-
;===============================================================================