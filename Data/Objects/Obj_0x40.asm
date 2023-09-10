;===============================================================================
; Objeto 0x40 - Molas tipo sanfona na Dust Hill, Chemical Plant e Neo Green Hill
; ->>>        
;===============================================================================     
; Offset_0x020D7C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x020D8E(PC, D0), D1
                jsr     Offset_0x020D8E(PC, D1)
                bra     Jmp_0F_To_MarkObjGone                  ; Offset_0x021028       
;-------------------------------------------------------------------------------     
Offset_0x020D8E:
                dc.w    Offset_0x020D98-Offset_0x020D8E
                dc.w    Offset_0x020DD4-Offset_0x020D8E     
;-------------------------------------------------------------------------------   
Offset_0x020D92:
                dc.w    $FC00, $F600, $F800                                   
;-------------------------------------------------------------------------------     
Offset_0x020D98:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Diagonal_Spring_Mappings, Obj_Map(A0) ; Offset_0x021000, $0004
                move.w  #$0440, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_12_To_ModifySpriteAttr_2P          ; Offset_0x021034
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$1C, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                bset    #$07, Obj_Status(A0)                             ; $0022
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$0002, D0
                move.w  Offset_0x020D92(PC, D0), Obj_Control_Var_04(A0)  ; $0030
;-------------------------------------------------------------------------------                  
Offset_0x020DD4:
                lea     (Diagonal_Spring_Animate_Data), A1     ; Offset_0x020FF4
                bsr     Jmp_03_To_AnimateSprite                ; Offset_0x02102E
                move.w  #$0027, D1
                move.w  #$0008, D2
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     Offset_0x020FA4(PC), A2
                tst.b   Obj_Map_Id(A0)                                   ; $001A
                beq.s   Offset_0x020DF8
                lea     Offset_0x020FCC(PC), A2
Offset_0x020DF8:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     Jmp_00_To_SolidObject_3_A1             ; Offset_0x02103A
                btst    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x020E10
                bsr.s   Offset_0x020E2A
Offset_0x020E10:
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$04, D6
                bsr     Jmp_00_To_SolidObject_3_A1             ; Offset_0x02103A
                btst    #$04, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x020E28
                bsr.s   Offset_0x020E2A
Offset_0x020E28:
                rts
Offset_0x020E2A:
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x020E42
                move.w  Obj_X(A0), D0                                    ; $0008
                subi.w  #$0010, D0
                cmp.w   Obj_X(A1), D0                                    ; $0008
                bcs.s   Offset_0x020E52
                rts
Offset_0x020E42:
                move.w  Obj_X(A0), D0                                    ; $0008
                addi.w  #$0010, D0
                cmp.w   Obj_X(A1), D0                                    ; $0008
                bcc.s   Offset_0x020E52
                rts
Offset_0x020E52:
                cmpi.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                beq.s   Offset_0x020E62
                move.w  #$0100, Obj_Ani_Number(A0)                       ; $001C
                rts
Offset_0x020E62:
                tst.b   Obj_Map_Id(A0)                                   ; $001A
                beq.s   Offset_0x020E6A
                rts
Offset_0x020E6A:
                move.w  Obj_X(A0), D0                                    ; $0008
                subi.w  #$001C, D0
                sub.w   Obj_X(A1), D0                                    ; $0008
                neg.w   D0
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x020E86
                not.w   D0
                addi.w  #$0027, D0
Offset_0x020E86:
                tst.w   D0
                bpl.s   Offset_0x020E8C
                moveq   #$00, D0
Offset_0x020E8C:
                lea     (Offset_0x020F5C), A3
                move.b  $00(A3, D0), D0
                move.w  #$FC00, Obj_Speed_Y(A1)                          ; $0012
                sub.b   D0, Obj_Speed_Y(A1)                              ; $0012
                bset    #$00, Obj_Status(A1)                             ; $0022
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x020EB6
                bclr    #$00, Obj_Status(A1)                             ; $0022
                neg.b   D0
Offset_0x020EB6:
                move.w  Obj_Speed(A1), D1                                ; $0010
                bpl.s   Offset_0x020EBE
                neg.w   D1
Offset_0x020EBE:
                cmpi.w  #$0400, D1
                bcs.s   Offset_0x020EC8
                sub.b   D0, Obj_Speed(A1)                                ; $0010
Offset_0x020EC8:
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$10, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$02, Obj_Routine(A1)                            ; $0024
                move.b  #$00, Obj_Player_Spdsh_Flag(A1)                  ; $0039
                move.b  Obj_Subtype(A0), D0                              ; $0028
                btst    #$00, D0
                beq.s   Offset_0x020F2A
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
                move.b  #$01, Obj_Flip_Angle(A1)                         ; $0027
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$01, Obj_P_Flips_Remaining(A1)                  ; $002C
                move.b  #$08, Obj_Player_Flip_Speed(A1)                  ; $002D
                btst    #$01, D0
                bne.s   Offset_0x020F1A
                move.b  #$03, Obj_P_Flips_Remaining(A1)                  ; $002C
Offset_0x020F1A:
                btst    #$00, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x020F2A
                neg.b   Obj_Flip_Angle(A1)                               ; $0027
                neg.w   Obj_Inertia(A1)                                  ; $0014
Offset_0x020F2A:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x020F40
                move.b  #$0C, Obj_Player_Top_Solid(A1)                   ; $003E
                move.b  #$0D, Obj_Player_LRB_Solid(A1)                   ; $003F
Offset_0x020F40:
                cmpi.b  #$08, D0
                bne.s   Offset_0x020F52
                move.b  #$0E, Obj_Player_Top_Solid(A1)                   ; $003E
                move.b  #$0F, Obj_Player_LRB_Solid(A1)                   ; $003F
Offset_0x020F52:
                move.w  #$00CC, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912
;------------------------------------------------------------------------------- 
Offset_0x020F5C:
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $01, $01, $01, $01, $01, $01, $01, $01
                dc.b    $01, $01, $01, $01, $01, $01, $01, $01
                dc.b    $02, $02, $02, $02, $02, $02, $02, $02
                dc.b    $03, $03, $03, $03, $03, $03, $04, $04
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00      
;-------------------------------------------------------------------------------    
Offset_0x020FA4:
                dc.b    $08, $08, $08, $08, $08, $08, $08, $09
                dc.b    $0A, $0B, $0C, $0D, $0E, $0F, $10, $10
                dc.b    $11, $12, $13, $14, $14, $15, $15, $16
                dc.b    $17, $18, $18, $18, $18, $18, $18, $18
                dc.b    $18, $18, $18, $18, $18, $18, $18, $18  
;-------------------------------------------------------------------------------    
Offset_0x020FCC:
                dc.b    $08, $08, $08, $08, $08, $08, $08, $09
                dc.b    $0A, $0B, $0C, $0C, $0C, $0C, $0D, $0D
                dc.b    $0D, $0D, $0D, $0D, $0E, $0E, $0F, $0F
                dc.b    $10, $10, $10, $10, $0F, $0F, $0E, $0E
                dc.b    $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D    
;-------------------------------------------------------------------------------
Diagonal_Spring_Animate_Data:                                  ; Offset_0x020FF4
                dc.w    Offset_0x020FF8-Diagonal_Spring_Animate_Data
                dc.w    Offset_0x020FFB-Diagonal_Spring_Animate_Data
Offset_0x020FF8:
                dc.b    $0F, $00, $FF
Offset_0x020FFB:
                dc.b    $03, $01, $00, $FD, $00                    
;-------------------------------------------------------------------------------
Diagonal_Spring_Mappings:                                      ; Offset_0x021000
                dc.w    Offset_0x021004-Diagonal_Spring_Mappings
                dc.w    Offset_0x021016-Diagonal_Spring_Mappings
Offset_0x021004:
                dc.w    $0002
                dc.l    $E8090000, $0000FFE4
                dc.l    $E80D0006, $0003FFFC
Offset_0x021016:
                dc.w    $0002
                dc.l    $E809000E, $0007FFE4
                dc.l    $E80D0014, $000AFFFC
;===============================================================================   
; Objeto 0x40 - Molas tipo sanfona na Dust Hill, Chemical Plant e Neo Green Hill
; <<<-        
;===============================================================================