;===============================================================================
; Objeto 0xA4 - Inimigo Asteron na Metropolis
; ->>>
;===============================================================================
Offset_0x032D84:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x032D92(PC, D0), D1
                jmp     Offset_0x032D92(PC, D1)             
;------------------------------------------------------------------------------- 
Offset_0x032D92:
                dc.w    Offset_0x032D9A-Offset_0x032D92
                dc.w    Offset_0x032D9E-Offset_0x032D92
                dc.w    Offset_0x032DC2-Offset_0x032D92
                dc.w    Offset_0x032E14-Offset_0x032D92
;-------------------------------------------------------------------------------     
Offset_0x032D9A:
                bra     Object_Settings                        ; Offset_0x030A30
Offset_0x032D9E:
                bsr     Offset_0x030B18
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcc.s   Offset_0x032DB6
                addi.w  #$0040, D3
                cmpi.w  #$0080, D3
                bcs.s   Offset_0x032DBA
Offset_0x032DB6:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032DBA:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032DC2:
                bsr     Offset_0x030B18
                tst.w   D2
                bpl.s   Offset_0x032DCC
                neg.w   D2
Offset_0x032DCC:
                cmpi.w  #$0010, D2
                bcs.s   Offset_0x032DE2
                cmpi.w  #$0060, D2
                bcc.s   Offset_0x032DE2
                move.w  Offset_0x032E02(PC, D0), Obj_Speed(A0)           ; $0010
                bsr     Offset_0x032E06
Offset_0x032DE2:
                tst.w   D3
                bpl.s   Offset_0x032DE8
                neg.w   D3
Offset_0x032DE8:
                cmpi.w  #$0010, D3
                bcs.s   Offset_0x032DFE
                cmpi.w  #$0060, D3
                bcc.s   Offset_0x032DFE
                move.w  Offset_0x032E02(PC, D1), Obj_Speed_Y(A0)         ; $0012
                bsr     Offset_0x032E06
Offset_0x032DFE:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608   
;-------------------------------------------------------------------------------
Offset_0x032E02:
                dc.w    $FFC0, $0040                                            
;-------------------------------------------------------------------------------     
Offset_0x032E06:
                move.b  #$06, Obj_Routine(A0)                            ; $0024
                move.b  #$40, Obj_Timer(A0)                              ; $002A
                rts
Offset_0x032E14:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x032E2C
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Asteron_Animate_Data), A1             ; Offset_0x032E78
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032E2C:
                move.b  #$27, Obj_Id(A0)                                 ; $0000
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                bsr     Offset_0x032E40
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032E40:
                move.b  #$30, D2
                moveq   #$04, D6
                lea     (Offset_0x032E50), A2
                bra     Enemy_Weapon                           ; Offset_0x030C98
;-------------------------------------------------------------------------------      
Offset_0x032E50:
                dc.b    $00, $F8, $00, $FC, $02, $00, $08, $FC
                dc.b    $03, $FF, $03, $01, $08, $08, $03, $03
                dc.b    $04, $01, $F8, $08, $FD, $03, $04, $00
                dc.b    $F8, $FC, $FD, $FF, $03, $00
;-------------------------------------------------------------------------------                  
Obj_0xA4_Ptr:                                                  ; Offset_0x032E6E
                dc.l    Asteron_Mappings                       ; Offset_0x032E7E
                dc.w    $8368
                dc.b    $04, $04, $10, $0B   
;-------------------------------------------------------------------------------
Asteron_Animate_Data:                                          ; Offset_0x032E78
                dc.w    Offset_0x032E7A-Asteron_Animate_Data
Offset_0x032E7A:
                dc.b    $01, $00, $01, $FF      
;-------------------------------------------------------------------------------
Asteron_Mappings:                                              ; Offset_0x032E7E
                dc.w    Offset_0x032E88-Asteron_Mappings
                dc.w    Offset_0x032E9A-Asteron_Mappings
                dc.w    Offset_0x032EB4-Asteron_Mappings
                dc.w    Offset_0x032EBE-Asteron_Mappings
                dc.w    Offset_0x032EC8-Asteron_Mappings
Offset_0x032E88:
                dc.w    $0002
                dc.l    $F0070000, $0000FFF0
                dc.l    $F0070800, $08000000
Offset_0x032E9A:
                dc.w    $0003
                dc.l    $FD00200E, $2007FFFC
                dc.l    $F0070000, $0000FFF0
                dc.l    $F0070800, $08000000
Offset_0x032EB4:
                dc.w    $0001
                dc.l    $F8010008, $0004FFFC
Offset_0x032EBE:
                dc.w    $0001
                dc.l    $FC04000A, $0005FFF8
Offset_0x032EC8:
                dc.w    $0001
                dc.l    $F801000C, $0006FFFC                                                                                  
;===============================================================================
; Objeto 0xA4 - Inimigo Asteron na Metropolis
; <<<-
;===============================================================================