;===============================================================================
; Objeto 0x26 - Monitores
; ->>>        
;===============================================================================
; Offset_0x00F6B0
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00F6BE(PC, D0), D1
                jmp     Offset_0x00F6BE(PC, D1) 
Offset_0x00F6BE:                      
                dc.w    Offset_0x00F6C8-Offset_0x00F6BE
                dc.w    Offset_0x00F72E-Offset_0x00F6BE
                dc.w    Offset_0x00F820-Offset_0x00F6BE
                dc.w    Offset_0x00F812-Offset_0x00F6BE
                dc.w    Offset_0x00F81C-Offset_0x00F6BE      
Offset_0x00F6C8:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$0E, Obj_Height_2(A0)                           ; $0016
                move.b  #$0E, Obj_Width_2(A0)                            ; $0017
                move.l  #Monitors_Mappings, Obj_Map(A0) ; Offset_0x00FB30, $0004
                move.w  #$0680, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.b  #$0F, Obj_Width(A0)                              ; $0019
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                bclr    #$07, $02(A2, D0)
                btst    #$00, $02(A2, D0)
                beq.s   Offset_0x00F722
                move.b  #$08, Obj_Routine(A0)                            ; $0024
                move.b  #$0B, Obj_Map_Id(A0)                             ; $001A
                rts
Offset_0x00F722:
                move.b  #$46, Obj_Col_Flags(A0)                          ; $0020
                move.b  Obj_Subtype(A0), Obj_Ani_Number(A0)       ; $001C, $0028
Offset_0x00F72E:
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                beq.s   Offset_0x00F788
                subq.b  #$02, D0
                bne.s   Offset_0x00F768
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                bsr     Exit_Plaform                           ; Offset_0x014FB8
                btst    #$03, Obj_Status(A1)                             ; $0022
                bne     Offset_0x00F758
                clr.b   Obj_Routine_2(A0)                                ; $0025
                bra     Offset_0x00F812
Offset_0x00F758:
                move.w  #$0010, D3
                move.w  Obj_X(A0), D2                                    ; $0008
                bsr     Player_On_Platform                     ; Offset_0x014C62
                bra     Offset_0x00F812
Offset_0x00F768:
                bsr     ObjectFall                             ; Offset_0x011F6A
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl     Offset_0x00F812
                add.w   D1, Obj_Y(A0)                                    ; $000C
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                clr.b   Obj_Routine_2(A0)                                ; $0025
                bra     Offset_0x00F812
Offset_0x00F788:
                move.w  #$001A, D1
                move.w  #$000F, D2
                bsr     Offset_0x00FA4E
                beq     Offset_0x00F7F8
                tst.w   Obj_Speed_Y(A1)                                  ; $0012
                bmi.s   Offset_0x00F7A6
                cmpi.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                beq.s   Offset_0x00F7F8
Offset_0x00F7A6:
                tst.w   D1
                bpl.s   Offset_0x00F7BC
                sub.w   D3, Obj_Y(A1)                                    ; $000C
                bsr     Player_On_Spiral                       ; Offset_0x014EE4
                move.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bra     Offset_0x00F812
Offset_0x00F7BC:
                tst.w   D0
                beq     Offset_0x00F7E2
                bmi.s   Offset_0x00F7CC
                tst.w   Obj_Speed(A1)                                    ; $0010
                bmi.s   Offset_0x00F7E2
                bra.s   Offset_0x00F7D2
Offset_0x00F7CC:
                tst.w   Obj_Speed(A1)                                    ; $0010
                bpl.s   Offset_0x00F7E2
Offset_0x00F7D2:
                sub.w   D0, Obj_X(A1)                                    ; $0008
                move.w  #$0000, Obj_Inertia(A1)                          ; $0014
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
Offset_0x00F7E2:
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x00F806
                bset    #$05, Obj_Status(A1)                             ; $0022
                bset    #$05, Obj_Status(A0)                             ; $0022
                bra.s   Offset_0x00F812
Offset_0x00F7F8:
                btst    #$05, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x00F812
                move.w  #$0001, Obj_Ani_Number(A1)                       ; $001C
Offset_0x00F806:
                bclr    #$05, Obj_Status(A0)                             ; $0022
                bclr    #$05, Obj_Status(A1)                             ; $0022
Offset_0x00F812:
                lea     (Monitors_Animate_Data), A1            ; Offset_0x00FAC8
                bsr     AnimateSprite                          ; Offset_0x01212E
Offset_0x00F81C:
                bra     MarkObjGone                            ; Offset_0x011FBC
Offset_0x00F820:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                bsr     SingleObjectLoad_2                     ; Offset_0x013BC0
                bne.s   Offset_0x00F848
                move.b  #$2E, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                             ; $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                             ; $000C
                move.b  Obj_Ani_Number(A0), Obj_Ani_Number(A1)           ; $001C
Offset_0x00F848:
                bsr     SingleObjectLoad_2                     ; Offset_0x013BC0
                bne.s   Offset_0x00F864
                move.b  #$27, Obj_Id(A1)                                 ; $0000
                addq.b  #$02, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                             ; $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                             ; $000C
Offset_0x00F864:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                bset    #$00, $02(A2, D0)
                move.b  #$0A, Obj_Ani_Number(A0)                         ; $001C
                bra     DisplaySprite                          ; Offset_0x0120DE
;===============================================================================
; Objeto 0x26 - Monitores
; <<<-        
;===============================================================================