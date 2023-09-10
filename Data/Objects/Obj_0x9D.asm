;===============================================================================
; Objeto 0x9D - Inimigo Coconuts na Green Hill
; ->>> 
;===============================================================================
; Offset_0x032048:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x032056(PC, D0), D1
                jmp     Offset_0x032056(PC, D1)
;-------------------------------------------------------------------------------                 
Offset_0x032056:                     
                dc.w    Offset_0x03205E-Offset_0x032056
                dc.w    Offset_0x03206A-Offset_0x032056
                dc.w    Offset_0x0320FC-Offset_0x032056
                dc.w    Offset_0x032122-Offset_0x032056                     
;-------------------------------------------------------------------------------  
Offset_0x03205E:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$10, Obj_Timer(A0)                              ; $002A
                rts
;-------------------------------------------------------------------------------                  
Offset_0x03206A:
                bsr     Offset_0x030B18
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                bclr    #$00, Obj_Status(A0)                             ; $0022
                tst.w   D0
                beq.s   Offset_0x03208A
                bset    #$00, Obj_Flags(A0)                              ; $0001
                bset    #$00, Obj_Status(A0)                             ; $0022
Offset_0x03208A:
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcc.s   Offset_0x03209E
                tst.b   $002E(A0)
                beq.s   Offset_0x0320B4
                subq.b  #$01, $002E(A0)
Offset_0x03209E:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x0320A8
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0320A8:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bsr     Offset_0x0320D0
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0320B4:
                move.b  #$06, Obj_Routine(A0)                            ; $0024
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                move.b  #$08, Obj_Timer(A0)                              ; $002A
                move.b  #$20, $002E(A0)
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0320D0:
                move.w  $002C(A0), D0  
                cmpi.w  #$000C, D0
                bcs.s   Offset_0x0320DC
                moveq   #$00, D0
Offset_0x0320DC:
                lea     Offset_0x0320F0(PC, D0), A1
                addq.w  #$02, D0
                move.w  D0, $002C(A0)
                move.b  (A1)+, Obj_Speed_Y(A0)                           ; $0012
                move.b  (A1)+, Obj_Timer(A0)                             ; $002A
                rts 
;-------------------------------------------------------------------------------  
Offset_0x0320F0:
                dc.b    $FF, $20, $01, $18, $FF, $10, $01, $28, $FF, $20, $01, $10    
;-------------------------------------------------------------------------------   
Offset_0x0320FC:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                beq.s   Offset_0x032114
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Coconuts_AnimateData), A1             ; Offset_0x0321D6
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032114:
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$10, Obj_Timer(A0)                              ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032122:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x032134(PC, D0), D1
                jsr     Offset_0x032134(PC, D1)
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608   
;-------------------------------------------------------------------------------    
Offset_0x032134:                 
                dc.w    Offset_0x032138-Offset_0x032134
                dc.w    Offset_0x032154-Offset_0x032134       
;-------------------------------------------------------------------------------  
Offset_0x032138:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x032140
                rts
Offset_0x032140:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$08, Obj_Timer(A0)                              ; $002A
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
                bra     Offset_0x032170
Offset_0x032154:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x03215C
                rts
Offset_0x03215C:
                clr.b   Obj_Routine_2(A0)                                ; $0025
                move.b  #$04, Obj_Routine(A0)                            ; $0024
                move.b  #$08, Obj_Timer(A0)                              ; $002A
                bra     Offset_0x0320D0
Offset_0x032170:
                bsr     Jmp_10_To_SingleObjectLoad             ; Offset_0x037602
                bne.s   Offset_0x0321C2
                move.b  #$98, Obj_Id(A1)                                 ; $0000
                move.b  #$03, Obj_Map_Id(A1)                             ; $001A
                move.b  #$20, Obj_Subtype(A1)                            ; $0028
                move.w  Obj_X(A0), Obj_X(A1)                             ; $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                             ; $000C
                addi.w  #$FFF3, Obj_Y(A1)                                ; $000C
                moveq   #$00, D0
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x0321A6
                moveq   #$04, D0
Offset_0x0321A6:
                lea     Offset_0x0321C4(PC, D0), A2
                move.w  (A2)+, D0
                add.w   D0, Obj_X(A1)                                    ; $0008
                move.w  (A2)+, Obj_Speed(A1)                             ; $0010
                move.w  #$FF00, Obj_Speed_Y(A1)                          ; $0012
                lea     Coconuts_Weapon(PC), A2                ; Offset_0x031B76
                move.l  A2, Obj_Timer(A1)                                ; $002A
Offset_0x0321C2:
                rts
;-------------------------------------------------------------------------------
Offset_0x0321C4:
                dc.w    $FFF5, $0100, $000B, $FF00
;------------------------------------------------------------------------------- 
Obj_0x9D_Ptr:                                                  ; Offset_0x0321CC
                dc.l    Coconuts_Mappings                      ; Offset_0x0321E4
                dc.w    $03EE, $0405
                dc.b    $0C, $09
;-------------------------------------------------------------------------------                            
Coconuts_AnimateData:                                          ; Offset_0x0321D6
                dc.w    Offset_0x0321DA-Coconuts_AnimateData
                dc.w    Offset_0x0321DE-Coconuts_AnimateData
Offset_0x0321DA:
                dc.b    $05, $00, $01, $FF
Offset_0x0321DE:
                dc.b    $09, $01, $02, $01, $FF, $00    
;-------------------------------------------------------------------------------  
Coconuts_Mappings:                                             ; Offset_0x0321E4  
                dc.w    Offset_0x0321EC-Coconuts_Mappings
                dc.w    Offset_0x03220E-Coconuts_Mappings
                dc.w    Offset_0x032230-Coconuts_Mappings
                dc.w    Offset_0x032252-Coconuts_Mappings
Offset_0x0321EC:
                dc.w    $0004
                dc.l    $0005001A, $000DFFFE, $F0090000, $0000FFFC
                dc.l    $000D0006, $0003FFF4, $1001000E, $0007000C
Offset_0x03220E:
                dc.w    $0004
                dc.l    $0005001E, $000FFFFE, $F0090000, $0000FFFC
                dc.l    $000D0010, $0008FFF4, $10010018, $000C000C
Offset_0x032230:
                dc.w    $0004
                dc.l    $F8010022, $00110007, $F0090000, $0000FFFC
                dc.l    $000D0010, $0008FFF4, $10010018, $000C000C
Offset_0x032252:
                dc.w    $0002
                dc.l    $F8014024, $4012FFF8, $F8014824, $48120000                                                     
;===============================================================================
; Objeto 0x9D - Inimigo Coconuts na Green Hill
; <<<- 
;===============================================================================