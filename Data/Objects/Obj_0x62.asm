;===============================================================================
; Objeto 0x62 - Contador de tempo regressivo no Special Stage
; ->>>
;===============================================================================
; Offset_0x0093BE:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0093CC(PC, D0), D1
                jmp     Offset_0x0093CC(PC, D1)   
;-------------------------------------------------------------------------------   
Offset_0x0093CC:
                dc.w    Offset_0x0093D2-Offset_0x0093CC
                dc.w    Offset_0x00944A-Offset_0x0093CC
                dc.w    Offset_0x00947E-Offset_0x0093CC
;-------------------------------------------------------------------------------       
Offset_0x0093D2:
                move.w  #$007C, Obj_X(A0)                                ; $0008
                move.w  #$0020, Obj_Y(A0)                                ; $000C
                move.l  #SS_Counter_Numbers_Mappings, Obj_Map(A0) ; Offset_0x009482, $0004
                move.w  #$4237, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #$FFFFB140, A1
                move.b  (A0), (A1)
                move.w  #$0084, Obj_X(A1)                                ; $0008
                move.w  #$0020, Obj_Y(A1)                                ; $000C
                move.l  #SS_Counter_Numbers_Mappings, Obj_Map(A1) ; Offset_0x009482, $0004
                move.w  #$4237, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$01, Obj_Priority(A1)                           ; $0018
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.l  A1, Obj_Control_Var_02(A0)                       ; $002E
                move.w  #$003B, ($FFFF9B38).w
                move.b  #$09, Obj_Map_Id(A0)                             ; $001A
                move.b  #$09, Obj_Map_Id(A1)                             ; $001A
                rts
;-------------------------------------------------------------------------------                
Offset_0x00944A:
                tst.b   ($FFFF9B23).w
                beq.s   Offset_0x00947A
                subq.b  #$01, ($FFFF9B38).w
                bne.s   Offset_0x00947A
                move.b  #$3C, ($FFFF9B38).w
                move.l  Obj_Control_Var_02(A0), A1                       ; $002E
                subq.b  #$01, Obj_Map_Id(A1)                             ; $001A
                bpl.s   Offset_0x00947A
                move.b  #$09, Obj_Map_Id(A1)                             ; $001A
                subq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                bpl.s   Offset_0x00947A
                clr.b   Obj_Map_Id(A0)                                   ; $001A
                clr.b   Obj_Map_Id(A1)                                   ; $001A
Offset_0x00947A:
                bra     Jmp_00_To_DisplaySprite                ; Offset_0x009694
;-------------------------------------------------------------------------------                
Offset_0x00947E:
                bra     Jmp_00_To_DisplaySprite                ; Offset_0x009694   
;-------------------------------------------------------------------------------  
SS_Counter_Numbers_Mappings:                                   ; Offset_0x009482
                dc.w    Count_Numb_0_Map-SS_Counter_Numbers_Mappings ; Offset_0x009496
                dc.w    Count_Numb_1_Map-SS_Counter_Numbers_Mappings ; Offset_0x0094A0
                dc.w    Count_Numb_2_Map-SS_Counter_Numbers_Mappings ; Offset_0x0094AA
                dc.w    Count_Numb_3_Map-SS_Counter_Numbers_Mappings ; Offset_0x0094B4
                dc.w    Count_Numb_4_Map-SS_Counter_Numbers_Mappings ; Offset_0x0094BE
                dc.w    Count_Numb_5_Map-SS_Counter_Numbers_Mappings ; Offset_0x0094C8
                dc.w    Count_Numb_6_Map-SS_Counter_Numbers_Mappings ; Offset_0x0094D2
                dc.w    Count_Numb_7_Map-SS_Counter_Numbers_Mappings ; Offset_0x0094DC
                dc.w    Count_Numb_8_Map-SS_Counter_Numbers_Mappings ; Offset_0x0094E6
                dc.w    Count_Numb_9_Map-SS_Counter_Numbers_Mappings ; Offset_0x0094F0
Count_Numb_0_Map:                                              ; Offset_0x009496
                dc.w    $0001
                dc.l    $F8018022, $8011FFFC
Count_Numb_1_Map:                                              ; Offset_0x0094A0
                dc.w    $0001
                dc.l    $F8018024, $8012FFFC
Count_Numb_2_Map:                                              ; Offset_0x0094AA
                dc.w    $0001
                dc.l    $F8018026, $8013FFFC
Count_Numb_3_Map:                                              ; Offset_0x0094B4
                dc.w    $0001
                dc.l    $F8018028, $8014FFFC
Count_Numb_4_Map:                                              ; Offset_0x0094BE
                dc.w    $0001
                dc.l    $F801802A, $8015FFFC
Count_Numb_5_Map:                                              ; Offset_0x0094C8
                dc.w    $0001
                dc.l    $F801802C, $8016FFFC
Count_Numb_6_Map:                                              ; Offset_0x0094D2
                dc.w    $0001
                dc.l    $F801802E, $8017FFFC
Count_Numb_7_Map:                                              ; Offset_0x0094DC
                dc.w    $0001
                dc.l    $F8018030, $8018FFFC
Count_Numb_8_Map:                                              ; Offset_0x0094E6
                dc.w    $0001
                dc.l    $F8018032, $8019FFFC
Count_Numb_9_Map:                                              ; Offset_0x0094F0
                dc.w    $0001
                dc.l    $F8018034, $801AFFFC                                               
;===============================================================================
; Objeto 0x62 - Contador de tempo regressivo no Special Stage
; <<<-
;===============================================================================