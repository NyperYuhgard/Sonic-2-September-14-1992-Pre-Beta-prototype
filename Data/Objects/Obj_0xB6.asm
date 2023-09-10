;===============================================================================
; Objeto 0xB6 - Plataforma Hélice na Sky Fortress
; ->>>
;===============================================================================
; Offset_0x035528:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x035536(PC, D0), D1
                jmp     Offset_0x035536(PC, D1)    
;-------------------------------------------------------------------------------  
Offset_0x035536:
                dc.w    Offset_0x035540-Offset_0x035536
                dc.w    Offset_0x035552-Offset_0x035536
                dc.w    Offset_0x0355A4-Offset_0x035536
                dc.w    Offset_0x03560A-Offset_0x035536
                dc.w    Offset_0x03567E-Offset_0x035536
;-------------------------------------------------------------------------------  
Offset_0x035540:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  Obj_Subtype(A0), D0                              ; $0028
                subi.b  #$60, D0
                move.b  D0, Obj_Routine(A0)                              ; $0024
                rts
;-------------------------------------------------------------------------------                
Offset_0x035552:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x035564(PC, D0), D1
                jsr     Offset_0x035564(PC, D1)
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608  
;-------------------------------------------------------------------------------
Offset_0x035564:
                dc.w    Offset_0x03556C-Offset_0x035564
                dc.w    Offset_0x035574-Offset_0x035564
                dc.w    Offset_0x03558C-Offset_0x035564
                dc.w    Offset_0x035596-Offset_0x035564
;-------------------------------------------------------------------------------  
Offset_0x03556C:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bra     Offset_0x0356C0
;------------------------------------------------------------------------------- 
Offset_0x035574:
                bsr     Offset_0x0356D8
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x035580
                rts
Offset_0x035580:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                clr.b   Obj_Ani_Number(A0)                               ; $001C
                bra     Offset_0x035704
;-------------------------------------------------------------------------------                 
Offset_0x03558C:
                lea     (Platform_Helix_Animate_Data), A1      ; Offset_0x03576A
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
;-------------------------------------------------------------------------------                 
Offset_0x035596:
                move.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$00C0, Obj_Timer(A0)                            ; $002A
                rts
Offset_0x0355A4:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x0355B6(PC, D0), D1
                jsr     Offset_0x0355B6(PC, D1)
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608    
;-------------------------------------------------------------------------------  
Offset_0x0355B6:
                dc.w    Offset_0x03556C-Offset_0x0355B6
                dc.w    Offset_0x0355BC-Offset_0x0355B6
                dc.w    Offset_0x0355E8-Offset_0x0355B6
;-------------------------------------------------------------------------------  
Offset_0x0355BC:
                bsr     Offset_0x0356D8
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x0355C8
                rts
Offset_0x0355C8:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$20, Obj_Timer(A0)                              ; $002A
                move.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                clr.b   Obj_Ani_Frame(A0)                                ; $001B
                clr.b   Obj_Ani_Time(A0)                                 ; $001E
                bsr     Offset_0x035704
                bra     Offset_0x035740
Offset_0x0355E8:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x0355F8
                lea     (Platform_Helix_Animate_Data), A1      ; Offset_0x03576A
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
Offset_0x0355F8:
                move.b  #$02, Obj_Routine_2(A0)                          ; $0025
                clr.b   Obj_Map_Id(A0)                                   ; $001A
                move.w  #$00C0, Obj_Timer(A0)                            ; $002A
                rts
Offset_0x03560A:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x03561C(PC, D0), D1
                jsr     Offset_0x03561C(PC, D1)
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608               
;-------------------------------------------------------------------------------
Offset_0x03561C:
                dc.w    Offset_0x035624-Offset_0x03561C
                dc.w    Offset_0x035640-Offset_0x03561C
                dc.w    Offset_0x03566E-Offset_0x03561C
                dc.w    Offset_0x035678-Offset_0x03561C
;-------------------------------------------------------------------------------  
Offset_0x035624:
                bsr     Offset_0x0356D8
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                bne.s   Offset_0x035634
                rts
Offset_0x035634:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0010, Obj_Timer(A0)                            ; $002A
                rts
Offset_0x035640:
                bsr     Offset_0x0356D8
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x03564C
                rts
Offset_0x03564C:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                bsr     Offset_0x030B18
                bclr    #$00, Obj_Status(A0)                             ; $0022
                tst.w   D0
                bne.s   Offset_0x03566A
                bset    #$00, Obj_Status(A0)                             ; $0022
Offset_0x03566A:
                bra     Offset_0x035704
Offset_0x03566E:
                lea     (Platform_Helix_Animate_Data), A1      ; Offset_0x03576A
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
Offset_0x035678:
                clr.b   Obj_Routine_2(A0)                                ; $0025
                rts
Offset_0x03567E:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x035690(PC, D0), D1
                jsr     Offset_0x035690(PC, D1)
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------  
Offset_0x035690:
                dc.w    Offset_0x035698-Offset_0x035690
                dc.w    Offset_0x0356A6-Offset_0x035690
                dc.w    Offset_0x03558C-Offset_0x035690
                dc.w    Offset_0x035596-Offset_0x035690
;-------------------------------------------------------------------------------  
Offset_0x035698:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
                bra     Offset_0x0356C0
Offset_0x0356A6:
                bsr     Offset_0x0356EE
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x0356B2
                rts
Offset_0x0356B2:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$04, Obj_Ani_Number(A0)                         ; $001C
                bra     Offset_0x035704
Offset_0x0356C0:
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                move.l  ($FFFFF636).w, D0
                andi.w  #$007F, D0
                move.w  D0, Obj_Timer(A0)                                ; $002A
                move.w  D0, Obj_Control_Var_00(A0)                       ; $002C
                rts
Offset_0x0356D8:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                move.w  #$0023, D1
                move.w  #$0004, D2
                move.w  #$0004, D3
                move.w  (A7)+, D4
                bra     Jmp_19_To_SolidObject                  ; Offset_0x03764A
Offset_0x0356EE:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                move.w  #$000F, D1
                move.w  #$0018, D2
                move.w  #$0018, D3
                move.w  (A7)+, D4
                bra     Jmp_19_To_SolidObject                  ; Offset_0x03764A
Offset_0x035704:
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq.s   Offset_0x03573E
                bclr    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x035726
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bclr    #$03, Obj_Status(A1)                             ; $0022
                bset    #$01, Obj_Status(A1)                             ; $0022
Offset_0x035726:
                bclr    #$04, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x03573E
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bclr    #$04, Obj_Status(A1)                             ; $0022
                bset    #$01, Obj_Status(A1)                             ; $0022
Offset_0x03573E:
                rts
Offset_0x035740:
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x03575E
                move.b  #$B7, Obj_Id(A1)                                 ; $0000
                move.b  #$6A, Obj_Subtype(A1)                            ; $0028
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
Offset_0x03575E:
                rts               
;-------------------------------------------------------------------------------  
Obj_0xB6_Ptr:                                                  ; Offset_0x035760
                dc.l    Platform_Helix_Mappings                ; Offset_0x03579E
                dc.w    $A393
                dc.b    $04, $04, $10, $00   
;-------------------------------------------------------------------------------    
Platform_Helix_Animate_Data:                                   ; Offset_0x03576A
                dc.w    Offset_0x035778-Platform_Helix_Animate_Data
                dc.w    Offset_0x03577E-Platform_Helix_Animate_Data
                dc.w    Offset_0x035782-Platform_Helix_Animate_Data
                dc.w    Offset_0x035788-Platform_Helix_Animate_Data
                dc.w    Offset_0x03578E-Platform_Helix_Animate_Data
                dc.w    Offset_0x035794-Platform_Helix_Animate_Data
                dc.w    Offset_0x035798-Platform_Helix_Animate_Data
Offset_0x035778:
                dc.b    $03, $01, $02, $FD, $01, $00
Offset_0x03577E:
                dc.b    $3F, $02, $FD, $02
Offset_0x035782:
                dc.b    $03, $02, $01, $00, $FA, $00
Offset_0x035788:
                dc.b    $01, $00, $01, $02, $03, $FF
Offset_0x03578E:
                dc.b    $03, $01, $00, $FD, $05, $00
Offset_0x035794:
                dc.b    $3F, $00, $FD, $06
Offset_0x035798:
                dc.b    $03, $00, $01, $02, $FA, $00    
;-------------------------------------------------------------------------------
Platform_Helix_Mappings:                                       ; Offset_0x03579E
                dc.w    Offset_0x0357A6-Platform_Helix_Mappings
                dc.w    Offset_0x0357B8-Platform_Helix_Mappings
                dc.w    Offset_0x0357CA-Platform_Helix_Mappings
                dc.w    Offset_0x0357DC-Platform_Helix_Mappings
Offset_0x0357A6:
                dc.w    $0002
                dc.l    $FC080000, $0000FFE8
                dc.l    $FC080800, $08000000
Offset_0x0357B8:
                dc.w    $0002
                dc.l    $EC060003, $0001FFF0
                dc.l    $FC061803, $18010000
Offset_0x0357CA:
                dc.w    $0002
                dc.l    $E8020009, $0004FFFC
                dc.l    $00021009, $1004FFFC
Offset_0x0357DC:
                dc.w    $0002
                dc.l    $EC060803, $08010000
                dc.l    $FC061003, $1001FFF0                                                                                                                                                                                        
;===============================================================================
; Objeto 0xB6 - Plataforma Hélice na Sky Fortress
; <<<-
;===============================================================================