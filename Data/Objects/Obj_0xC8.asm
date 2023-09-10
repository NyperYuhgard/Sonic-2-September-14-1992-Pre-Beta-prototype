;===============================================================================
; Objeto 0xC8 - Inimigo Crawl na Casino Night
; ->>>
;=============================================================================== 
Offset_0x0374C2:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0374D0(PC, D0), D1
                jmp     Offset_0x0374D0(PC, D1)    
Offset_0x0374D0:
                dc.w    Offset_0x0374D6-Offset_0x0374D0
                dc.w    Offset_0x0374DA-Offset_0x0374D0
                dc.w    Offset_0x037504-Offset_0x0374D0
Offset_0x0374D6:
                bra     Object_Settings                        ; Offset_0x030A30
Offset_0x0374DA:
                moveq   #$60, D4
                bsr     Offset_0x030B3A
                bne.s   Offset_0x0374E6
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0374E6:
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                tst.w   D0
                beq.s   Offset_0x0374F6
                bset    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x0374F6:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x037504:
                moveq   #$60, D4
                bsr     Offset_0x030B3A
                beq.s   Offset_0x037536
                move.b  Obj_Col_Prop(A0), D0                             ; $0021
                beq.s   Offset_0x03753E
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bclr    #$00, Obj_Col_Prop(A0)                           ; $0021
                beq.s   Offset_0x037520
                bsr.s   Offset_0x037542
Offset_0x037520:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bclr    #$01, Obj_Col_Prop(A0)                           ; $0021
                beq.s   Offset_0x03752E
                bsr.s   Offset_0x037542
Offset_0x03752E:
                clr.b   Obj_Col_Prop(A0)                                 ; $0021
                bra     Offset_0x03753E
Offset_0x037536:
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
                clr.b   Obj_Map_Id(A0)                                   ; $001A
Offset_0x03753E:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x037542:
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
                beq.s   Offset_0x0375BA
                cmpi.b  #$8A, $02(A2, D0)
                bcc.s   Offset_0x0375BA
                addq.b  #$01, $02(A2, D0)
Offset_0x0375BA:
                rts                    
;-------------------------------------------------------------------------------
Obj_0xC8_Ptr:                                                  ; Offset_0x0375BC
                dc.l    Crawl_Mappings                         ; Offset_0x0375C6
                dc.w    $8340
                dc.b    $04, $01, $10, $D7
;-------------------------------------------------------------------------------
Crawl_Mappings:                                                ; Offset_0x0375C6
                dc.w    Offset_0x0375CA-Crawl_Mappings
                dc.w    Offset_0x0375DC-Crawl_Mappings
Offset_0x0375CA:
                dc.w    $0002
                dc.l    $F00F2000, $2000FFEC
                dc.l    $F0032010, $2008000C
Offset_0x0375DC:
                dc.w    $0002
                dc.l    $F00F2014, $200AFFEC
                dc.l    $F0032024, $2012000C
;===============================================================================
; Objeto 0xC8 - Inimigo Crawl na Casino Night
; <<<-
;===============================================================================