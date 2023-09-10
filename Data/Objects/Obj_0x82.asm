;===============================================================================
; Objeto 0x82 -> Pilar cai ao pisar em cima na Neo Green Hill
; ->>>        
;===============================================================================  
; Offset_0x024DFC:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x024E0A(PC, D0), D1
                jmp     Offset_0x024E0A(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x024E0A:
                dc.w    Offset_0x024E16-Offset_0x024E0A
                dc.w    Offset_0x024E7E-Offset_0x024E0A          
;-------------------------------------------------------------------------------
Offset_0x024E0E:
                dc.b    $20, $08, $1C, $30, $10, $10, $10, $10   
;-------------------------------------------------------------------------------
Offset_0x024E16:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Falling_Pillar_Mappings, Obj_Map(A0) ; Offset_0x024FE2 ,$0004
                move.w  #$0000, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_27_To_ModifySpriteAttr_2P          ; Offset_0x02504A
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsr.w   #$03, D0
                andi.w  #$000E, D0
                lea     Offset_0x024E0E(PC, D0), A2
                move.b  (A2)+, Obj_Width(A0)                             ; $0019
                move.b  (A2), Obj_Height_2(A0)                           ; $0016
                lsr.w   #$01, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                move.w  Obj_X(A0), Obj_Control_Var_08(A0)         ; $0008, $0034
                move.w  Obj_Y(A0), Obj_Control_Var_04(A0)         ; $000C, $0030
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.b  #$0F, D0
                beq.s   Offset_0x024E78
                cmpi.b  #$07, D0
                beq.s   Offset_0x024E78
                move.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x024E78:
                andi.b  #$0F, Obj_Subtype(A0)                            ; $0028
;-------------------------------------------------------------------------------                
Offset_0x024E7E:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                add.w   D0, D0
                move.w  Offset_0x024EC4(PC, D0), D1
                jsr     Offset_0x024EC4(PC, D1)
                move.w  (A7)+, D4
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x024EBC
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  Obj_Height_2(A0), D2                             ; $0016
                move.w  D2, D3
                addq.w  #$01, D3
                bsr     Jmp_14_To_SolidObject                  ; Offset_0x025056
                swap.w  D6
                move.b  D6, Obj_Control_Var_13(A0)                       ; $003F
                bsr     Offset_0x024F9E
Offset_0x024EBC:
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                bra     Jmp_06_To_MarkObjGone_2                ; Offset_0x02505C     
;-------------------------------------------------------------------------------
Offset_0x024EC4:
                dc.w    Offset_0x024ED4-Offset_0x024EC4
                dc.w    Offset_0x024ED6-Offset_0x024EC4
                dc.w    Offset_0x024EFE-Offset_0x024EC4
                dc.w    Offset_0x024ED6-Offset_0x024EC4
                dc.w    Offset_0x024F22-Offset_0x024EC4
                dc.w    Offset_0x024F44-Offset_0x024EC4
                dc.w    Offset_0x024EFE-Offset_0x024EC4
                dc.w    Offset_0x024F58-Offset_0x024EC4      
;-------------------------------------------------------------------------------
Offset_0x024ED4:
                rts  
;-------------------------------------------------------------------------------
Offset_0x024ED6:
                tst.w   Obj_Control_Var_0A(A0)                           ; $0036
                bne.s   Offset_0x024EEE
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq.s   Offset_0x024EEC
                move.w  #$001E, Obj_Control_Var_0A(A0)                   ; $0036
Offset_0x024EEC:
                rts
Offset_0x024EEE:
                subq.w  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                bne.s   Offset_0x024EEC
                addq.b  #$01, Obj_Subtype(A0)                            ; $0028
                clr.b   Obj_Control_Var_0C(A0)                           ; $0038
                rts         
;-------------------------------------------------------------------------------
Offset_0x024EFE:
                bsr     Jmp_0E_To_SpeedToPos                   ; Offset_0x025062
                addi.w  #$0008, Obj_Speed_Y(A0)                          ; $0012
                bsr     Jmp_01_To_ObjHitFloor                  ; Offset_0x025044
                tst.w   D1
                bpl     Offset_0x024F20
                addq.w  #$01, D1
                add.w   D1, Obj_Y(A0)                                    ; $000C
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                clr.b   Obj_Subtype(A0)                                  ; $0028
Offset_0x024F20:
                rts 
;-------------------------------------------------------------------------------
Offset_0x024F22:
                bsr     Jmp_0E_To_SpeedToPos                   ; Offset_0x025062
                subi.w  #$0008, Obj_Speed_Y(A0)                          ; $0012
                bsr     Jmp_00_To_Object_HitCeiling            ; Offset_0x025050
                tst.w   D1
                bpl     Offset_0x024F42
                sub.w   D1, Obj_Y(A0)                                    ; $000C
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                clr.b   Obj_Subtype(A0)                                  ; $0028
Offset_0x024F42:
                rts  
;-------------------------------------------------------------------------------
Offset_0x024F44:
                move.b  Obj_Control_Var_13(A0), D0                       ; $003F
                andi.b  #$03, D0
                beq.s   Offset_0x024F56
                addq.b  #$01, Obj_Subtype(A0)                            ; $0028
                clr.b   Obj_Control_Var_0C(A0)                           ; $0038
Offset_0x024F56:
                rts
Offset_0x024F58:
                move.w  (Water_Level).w, D0                          ; $FFFFF646
                sub.w   Obj_Y(A0), D0                                    ; $000C
                beq.s   Offset_0x024F9C
                bcc.s   Offset_0x024F80
                cmpi.w  #$FFFE, D0
                bge.s   Offset_0x024F6C
                moveq   #-$02, D0
Offset_0x024F6C:
                add.w   D0, Obj_Y(A0)                                    ; $000C
                bsr     Jmp_00_To_Object_HitCeiling            ; Offset_0x025050
                tst.w   D1
                bpl     Offset_0x024F7E
                sub.w   D1, Obj_Y(A0)                                    ; $000C
Offset_0x024F7E:
                rts
Offset_0x024F80:
                cmpi.w  #$0002, D0
                ble.s   Offset_0x024F88
                moveq   #$02, D0      
;-------------------------------------------------------------------------------
Offset_0x024F88:
                add.w   D0, Obj_Y(A0)                                    ; $000C
                bsr     Jmp_01_To_ObjHitFloor                  ; Offset_0x025044
                tst.w   D1
                bpl     Offset_0x024F9C
                addq.w  #$01, D1
                add.w   D1, Obj_Y(A0)                                    ; $000C
Offset_0x024F9C:
                rts
Offset_0x024F9E:
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                beq.s   Offset_0x024FE0
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                bne.s   Offset_0x024FBA
                tst.b   Obj_Control_Var_12(A0)                           ; $003E
                beq.s   Offset_0x024FE0
                subq.b  #$04, Obj_Control_Var_12(A0)                     ; $003E
                bra.s   Offset_0x024FC6
Offset_0x024FBA:
                cmpi.b  #$40, Obj_Control_Var_12(A0)                     ; $003E
                beq.s   Offset_0x024FE0
                addq.b  #$04, Obj_Control_Var_12(A0)                     ; $003E
Offset_0x024FC6:
                move.b  Obj_Control_Var_12(A0), D0                       ; $003E
                jsr     (CalcSine)                             ; Offset_0x00396A
                move.w  #$0400, D1
                muls.w  D1, D0
                swap.w  D0
                add.w   Obj_Control_Var_04(A0), D0                       ; $0030
                move.w  D0, Obj_Y(A0)                                    ; $000C
Offset_0x024FE0:
                rts           
;-------------------------------------------------------------------------------
Falling_Pillar_Mappings:                                       ; Offset_0x024FE2
                dc.w    Offset_0x024FE6-Falling_Pillar_Mappings
                dc.w    Offset_0x024FF8-Falling_Pillar_Mappings
Offset_0x024FE6:
                dc.w    $0002
                dc.l    $F80D6055, $602AFFE0
                dc.l    $F80D6055, $602A0000
Offset_0x024FF8:
                dc.w    $0009
                dc.l    $D005205D, $202EFFE0
                dc.l    $D005285D, $282E0010
                dc.l    $D00D2061, $2030FFF0
                dc.l    $E00D2069, $2034FFF0
                dc.l    $F00D2069, $2034FFF0
                dc.l    $000D2071, $2038FFF0
                dc.l    $100D2069, $2034FFF0
                dc.l    $200D2079, $203CFFF0
                dc.l    $30042081, $2040FFF0
;===============================================================================   
; Objeto 0x82 -> Pilar cai ao pisar em cima na Neo Green Hill
; <<<-        
;===============================================================================