;===============================================================================
; Objeto 0xB0 - Sonic correndo na tela SEGA
; ->>> 
;===============================================================================
; Offset_0x03454A
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x034558(PC, D0), D1
                jmp     Offset_0x034558(PC, D1)
;-------------------------------------------------------------------------------  
Offset_0x034558:
                dc.w    Offset_0x034564-Offset_0x034558
                dc.w    Offset_0x034662-Offset_0x034558
                dc.w    Offset_0x03469A-Offset_0x034558
                dc.w    Offset_0x034704-Offset_0x034558
                dc.w    Offset_0x03473A-Offset_0x034558
                dc.w    Offset_0x034764-Offset_0x034558    
;-------------------------------------------------------------------------------                  
Offset_0x034564:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.w  #$01E8, Obj_X(A0)                                ; $0008
                move.w  #$00F0, Obj_Sub_Y(A0)                            ; $000A
                move.w  #$000B, Obj_Timer(A0)                            ; $002A
                move.w  #$0002, ($FFFFF662).w
                bset    #$00, Obj_Flags(A0)                              ; $0001
                bset    #$00, Obj_Status(A0)                             ; $0022
                lea     ($FFFFE138).w, A1
                lea     Offset_0x034ADA(PC), A2
                moveq   #$00, D0
                moveq   #$22, D6
Offset_0x034598:
                move.b  (A2)+, D0
                add.w   D0, (A1)
                addq.w  #$08, A1
                dbra    D6, Offset_0x034598
                lea     Offset_0x034602(PC), A1
                lea     (Art_Sonic), A3                        ; Offset_0x050000
                lea     (M68K_RAM_Start), A5                         ; $FFFF0000
                moveq   #$03, D5
Offset_0x0345B4:
                move.l  (A1)+, A2
                move.w  (A2)+, D6
                subq.w  #$01, D6
Offset_0x0345BA:
                move.w  (A2)+, D0
                move.w  D0, D1
                andi.w  #$0FFF, D0
                lsl.w   #$05, D0
                lea     $00(A3, D0), A4
                andi.w  #$F000, D1
                rol.w   #$04, D1
                addq.w  #$01, D1
                lsl.w   #$03, D1
                subq.w  #$01, D1
Offset_0x0345D4:
                move.l  (A4)+, (A5)+
                dbra    D1, Offset_0x0345D4
                dbra    D6, Offset_0x0345BA
                dbra    D5, Offset_0x0345B4
                move.w  D7, -(A7)
                moveq   #$00, D0
                moveq   #$00, D1
                lea     Offset_0x034612(PC), A6
                moveq   #$07, D7
Offset_0x0345EE:
                move.l  (A6)+, A1
                move.l  (A6)+, A2
                move.b  (A6)+, D0
                move.b  (A6)+, D1
                bsr     Sub_Sega_Intro                         ; Offset_0x034AFE
                dbra    D7, Offset_0x0345EE
                move.w  (A7)+, D7
                rts         
;-------------------------------------------------------------------------------
Offset_0x034602:
                dc.l    Offset_0x07181A
                dc.l    Offset_0x071820
                dc.l    Offset_0x071826
                dc.l    Offset_0x07182C 
;------------------------------------------------------------------------------- 
Offset_0x034612:
                dc.l    $FFFF0000, $FFFF0B00
                dc.b    $02, $01
                dc.l    $FFFF00C0, $FFFF0E00
                dc.b    $03, $03
                dc.l    $FFFF02C0, $FFFF1600
                dc.b    $02, $01
                dc.l    $FFFF0380, $FFFF1900
                dc.b    $03, $03
                dc.l    $FFFF0580, $FFFF2100
                dc.b    $02, $01
                dc.l    $FFFF0640, $FFFF2400
                dc.b    $03, $03
                dc.l    $FFFF0840, $FFFF2C00
                dc.b    $02, $01
                dc.l    $FFFF0900, $FFFF2F00
                dc.b    $03, $03  
;-------------------------------------------------------------------------------   
Offset_0x034662:
                subi.w  #$0020, Obj_X(A0)                                ; $0008
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x034680
                bsr     Offset_0x034794
                lea     (Sonic_Sega_Logo_Animate_Data), A1     ; Offset_0x03490C
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x034680:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$000C, Obj_Timer(A0)                            ; $002A
                move.b  #$01, $002C(A0)
                move.b  #$FF, $002D(A0)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6  
;------------------------------------------------------------------------------- 
Offset_0x03469A:
                tst.w   Obj_Timer(A0)                                    ; $002A
                beq.s   Offset_0x0346A8
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bsr     Offset_0x034794
Offset_0x0346A8:
                lea     Offset_0x03480C(PC), A1
                bsr     Offset_0x0347BC
                bne.s   Offset_0x0346B4
                rts
Offset_0x0346B4:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bchg    #00, Obj_Flags(A0)                               ; $0001
                move.w  #$000B, Obj_Timer(A0)                            ; $002A
                move.w  #$0004, ($FFFFF662).w
                subi.w  #$0028, Obj_X(A0)                                ; $0008
                bchg    #00, Obj_Flags(A0)                               ; $0001
                bchg    #00, Obj_Status(A0)                              ; $0022
                lea     (Scroll_Buffer_Data).w, A1                   ; $FFFFE000
                moveq   #$00, D0
                move.w  #$0400, D1
Offset_0x0346E6:
                move.l  D0, (A1)+
                dbra    D1, Offset_0x0346E6
                lea     ($FFFFE13C).w, A1
                lea     Offset_0x034ADA(PC), A2
                moveq   #$00, D0
                moveq   #$22, D6
Offset_0x0346F8:
                move.b  (A2)+, D0
                sub.w   D0, (A1)
                addq.w  #$08, A1
                dbra    D6, Offset_0x0346F8
                rts    
;-------------------------------------------------------------------------------
Offset_0x034704:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x034722
                addi.w  #$0020, Obj_X(A0)                                ; $0008
                bsr     Offset_0x0347A8
                lea     (Sonic_Sega_Logo_Animate_Data), A1     ; Offset_0x03490C
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x034722:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$000C, Obj_Timer(A0)                            ; $002A
                move.b  #$01, $002C(A0)
                move.b  #$FF, $002D(A0)
                rts                                         
;-------------------------------------------------------------------------------   
Offset_0x03473A:
                tst.w   Obj_Timer(A0)                                    ; $002A
                beq.s   Offset_0x034748
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bsr     Offset_0x0347A8
Offset_0x034748:
                lea     Offset_0x034882(PC), A1
                bsr     Offset_0x0347BC
                bne.s   Offset_0x034754
                rts
Offset_0x034754:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                st      ($FFFFF660).w
                move.b  #$FA, D0
                bsr     Jmp_05_To_Play_Sfx                     ; Offset_0x037614
Offset_0x034764:                
                rts    
;-------------------------------------------------------------------------------
                                     
;===============================================================================
; Objeto 0xB0 - Sonic correndo na tela SEGA
; <<<- 
;===============================================================================