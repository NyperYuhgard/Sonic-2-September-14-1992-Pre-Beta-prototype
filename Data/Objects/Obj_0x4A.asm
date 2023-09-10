;===============================================================================
; Objeto 0x4A - Inimigo Octus na Oil Ocean
; ->>> 
;===============================================================================
; Offset_0x027C84:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x027C92(PC, D0), D1
                jmp     Offset_0x027C92(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x027C92:
                dc.w    Offset_0x027CC2-Offset_0x027C92
                dc.w    Offset_0x027D28-Offset_0x027C92
                dc.w    Offset_0x027CB6-Offset_0x027C92
                dc.w    Offset_0x027C9A-Offset_0x027C92         
;-------------------------------------------------------------------------------
Offset_0x027C9A:
                subi.w  #$0001, Obj_Control_Var_00(A0)                   ; $002C
                bmi.s   Offset_0x027CA4
                rts
Offset_0x027CA4:
                bsr     Jmp_02_To_ObjectFall                   ; Offset_0x027F2C
                lea     (Octus_AnimateData), A1                ; Offset_0x027E76
                bsr     Jmp_0C_To_AnimateSprite                ; Offset_0x027F26
                bra     Jmp_20_To_MarkObjGone                  ; Offset_0x027F20
Offset_0x027CB6:
                subq.w  #$01, Obj_Control_Var_00(A0)                     ; $002C
                beq     Jmp_19_To_DeleteObject                 ; Offset_0x027F1A
                bra     Jmp_17_To_DisplaySprite                ; Offset_0x027F14
Offset_0x027CC2:
                move.l  #Octus_Mappings, Obj_Map(A0)    ; Offset_0x027E88, $0004
                move.w  #$2538, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$0A, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$10, Obj_Height_2(A0)                           ; $0016
                move.b  #$08, Obj_Width_2(A0)                            ; $0017
                bsr     Jmp_02_To_ObjectFall                   ; Offset_0x027F2C
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x027D20
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   ($FFFFB008).w, D0
                bpl.s   Offset_0x027D20
                bchg    #00, Obj_Status(A0)                              ; $0022
Offset_0x027D20:
                move.w  Obj_Y(A0), Obj_Timer(A0)                  ; $000C, $002A
                rts
Offset_0x027D28:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x027D44(PC, D0), D1
                jsr     Offset_0x027D44(PC, D1)
                lea     (Octus_AnimateData), A1                ; Offset_0x027E76
                bsr     Jmp_0C_To_AnimateSprite                ; Offset_0x027F26
                bra     Jmp_20_To_MarkObjGone                  ; Offset_0x027F20       
;-------------------------------------------------------------------------------
Offset_0x027D44:
                dc.w    Offset_0x027D4C-Offset_0x027D44
                dc.w    Offset_0x027D6C-Offset_0x027D44
                dc.w    Offset_0x027D8E-Offset_0x027D44
                dc.w    Offset_0x027E60-Offset_0x027D44     
;-------------------------------------------------------------------------------    
Offset_0x027D4C:
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   ($FFFFB008).w, D0
                cmpi.w  #$0080, D0
                bgt.s   Offset_0x027D6A
                cmpi.w  #$FF80, D0
                blt.s   Offset_0x027D6A
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
Offset_0x027D6A:
                rts
Offset_0x027D6C:
                subi.l  #$00018000, Obj_Y(A0)                            ; $000C
                move.w  Obj_Timer(A0), D0                                ; $002A
                sub.w   Obj_Y(A0), D0                                    ; $000C
                cmpi.w  #$0020, D0
                ble.s   Offset_0x027D8C
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0000, Obj_Control_Var_00(A0)                   ; $002C
Offset_0x027D8C:
                rts
Offset_0x027D8E:
                subi.w  #$0001, Obj_Control_Var_00(A0)                   ; $002C
                beq     Offset_0x027E5A
                bpl     Offset_0x027E58
                move.w  #$001E, Obj_Control_Var_00(A0)                   ; $002C
                jsr     (SingleObjectLoad)                     ; Offset_0x013BAA
                bne.s   Offset_0x027DF4
                move.b  #$4A, Obj_Id(A1)                                 ; $0000
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.l  #Octus_Mappings, Obj_Map(A1)    ; Offset_0x027E88, $0004
                move.b  #$04, Obj_Map_Id(A1)                             ; $001A
                move.w  #$2538, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  #$001E, Obj_Control_Var_00(A1)                   ; $002C
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                move.b  Obj_Status(A0), Obj_Status(A1)            ; $0022, $0022
Offset_0x027DF4:
                jsr     (SingleObjectLoad)                     ; Offset_0x013BAA
                bne.s   Offset_0x027E58
                move.b  #$4A, Obj_Id(A1)                                 ; $0000
                move.b  #$06, Obj_Routine(A1)                            ; $0024
                move.l  #Octus_Mappings, Obj_Map(A1)    ; Offset_0x027E88 ,$0004
                move.w  #$2538, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  #$000F, Obj_Control_Var_00(A1)                   ; $002C
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                move.b  Obj_Status(A0), Obj_Status(A1)            ; $0022, $0022
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                move.w  #$FA80, Obj_Speed(A1)                            ; $0010
                btst    #$00, Obj_Flags(A1)                              ; $0001
                beq.s   Offset_0x027E58
                neg.w   Obj_Speed(A1)                                    ; $0010
Offset_0x027E58:
                rts
Offset_0x027E5A:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                rts
Offset_0x027E60:
                move.w  #$FFFA, D0
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x027E6E
                neg.w   D0
Offset_0x027E6E:
                add.w   D0, Obj_X(A0)                                    ; $0008
                bra     Jmp_20_To_MarkObjGone                  ; Offset_0x027F20       
;-------------------------------------------------------------------------------
Octus_AnimateData:                                            ; Offset_0x027E76 
                dc.w    Offset_0x027E7C-Octus_AnimateData
                dc.w    Offset_0x027E7F-Octus_AnimateData
                dc.w    Offset_0x027E84-Octus_AnimateData
Offset_0x027E7C:
                dc.b    $0F, $00, $FF
Offset_0x027E7F:
                dc.b    $03, $01, $02, $03, $FF
Offset_0x027E84:
                dc.b    $02, $05, $06, $FF                  
;-------------------------------------------------------------------------------
Octus_Mappings:                                                ; Offset_0x027E88
                dc.w    Offset_0x027E96-Octus_Mappings
                dc.w    Offset_0x027EA8-Octus_Mappings
                dc.w    Offset_0x027EC2-Octus_Mappings
                dc.w    Offset_0x027EDC-Octus_Mappings
                dc.w    Offset_0x027EF6-Octus_Mappings
                dc.w    Offset_0x027F00-Octus_Mappings
                dc.w    Offset_0x027F0A-Octus_Mappings
Offset_0x027E96:
                dc.w    $0002
                dc.l    $F00D0000, $0000FFF0
                dc.l    $000D0008, $0004FFF0
Offset_0x027EA8:
                dc.w    $0003
                dc.l    $F00D0000, $0000FFF0
                dc.l    $00090010, $0008FFE8
                dc.l    $00090016, $000B0000
Offset_0x027EC2:
                dc.w    $0003
                dc.l    $F00D0000, $0000FFF0
                dc.l    $0009001C, $000EFFE8
                dc.l    $00090022, $00110000
Offset_0x027EDC:
                dc.w    $0003
                dc.l    $F00D0000, $0000FFF0
                dc.l    $00090028, $0014FFE8
                dc.l    $0009002E, $00170000
Offset_0x027EF6:
                dc.w    $0001
                dc.l    $F0010034, $001AFFF7
Offset_0x027F00:
                dc.w    $0001
                dc.l    $F2010036, $001BFFF0
Offset_0x027F0A:
                dc.w    $0001
                dc.l    $F2010038, $001CFFF0
;===============================================================================
; Objeto 0x4A - Inimigo Octus na Oil Ocean
; <<<- 
;===============================================================================
