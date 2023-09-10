;===============================================================================
; Objeto 0xAB - Inimigo Grabber na Chemical Plant
; ->>>          Objeto vinculado ao 0xA7
;===============================================================================     
; Offset_0x033480:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x03348E(PC, D0), D1
                jmp     Offset_0x03348E(PC, D1)   
;-------------------------------------------------------------------------------
Offset_0x03348E:
                dc.w    Offset_0x033492-Offset_0x03348E
                dc.w    Offset_0x033496-Offset_0x03348E  
;-------------------------------------------------------------------------------
Offset_0x033492:
                bra     Object_Settings                        ; Offset_0x030A30  
;-------------------------------------------------------------------------------
Offset_0x033496:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------
Obj_0xA7_Sub:                                                  ; Offset_0x03349A
                move.w  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  (A1), D0
                tst.b   Obj_Control_Var_05(A0)                           ; $0031
                beq.s   Offset_0x0334C4
                subq.b  #$01, Obj_Control_Var_0B(A0)                     ; $0037
                beq.s   Offset_0x0334D8
                move.b  Obj_Control_Var_0A(A0), D1                       ; $0036
                andi.b  #$0C, D0
                beq.s   Offset_0x0334C2
                cmp.b   D1, D0
                beq.s   Offset_0x0334C2
                move.b  D0, Obj_Control_Var_0A(A0)                       ; $0036
                addq.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x0334C2:
                rts
Offset_0x0334C4:
                andi.b  #$0C, D0
                beq.s   Offset_0x0334C2
                nop
                st      Obj_Control_Var_05(A0)                           ; $0031
                move.b  D0, Obj_Control_Var_0A(A0)                       ; $0036
                nop
                rts
Offset_0x0334D8:
                cmpi.b  #$04, Obj_Control_Var_0C(A0)                     ; $0038
                bcs.s   Offset_0x033508
                move.b  #$0A, Obj_Routine_2(A0)                          ; $0025
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                clr.b   Obj_Col_Flags(A0)                                ; $0020
                move.w  Obj_Control_Var_06(A0), A2                       ; $0032
                move.b  #$00, Obj_Timer(A2)                              ; $002A
                bset    #$01, Obj_Status(A2)                             ; $0022
                move.b  #$00, Obj_Ani_Number(A2)                         ; $001C
                clr.w   Obj_Control_Var_06(A0)                           ; $0032
Offset_0x033508:
                move.b  #$20, Obj_Control_Var_0B(A0)                     ; $0037
                clr.b   Obj_Control_Var_05(A0)                           ; $0031
                clr.b   Obj_Control_Var_0C(A0)                           ; $0038
                rts
;-------------------------------------------------------------------------------
Obj_0xA7_Sub_01:                                               ; Offset_0x033518
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bne.s   Offset_0x033530
                move.b  Obj_Player_Status(A0), Obj_Timer(A0)      ; $002A, $002B
                subq.b  #$01, Obj_Player_Status(A0)                      ; $002B
                beq.s   Offset_0x033532
                bchg    #05, Obj_Art_VRAM(A0)                            ; $0002
Offset_0x033530:
                rts
Offset_0x033532:
                move.b  #$27, Obj_Id(A0)                                 ; $0000
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                bset    #$05, Obj_Art_VRAM(A0)                           ; $0002
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                beq.s   Offset_0x03355E
                move.w  D0, A2
                move.b  #$00, Obj_Timer(A2)                              ; $002A
                bset    #$01, Obj_Status(A2)                             ; $0022
                move.b  #$0B, Obj_Col_Flags(A0)                          ; $0020
Offset_0x03355E:
                rts
;-------------------------------------------------------------------------------
Obj_0xA7_Sub_02:                                               ; Offset_0x033560
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                beq.s   Offset_0x03356A
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x03356A:
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x033582
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x033582:
                lea     ($FFFFFC00).w, A3
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x033594
                bclr    #$07, $02(A3, D0)
Offset_0x033594:
                tst.b   Obj_Control_Var_04(A0)                           ; $0030
                beq.s   Offset_0x0335AA
                move.w  Obj_Control_Var_06(A0), A3                       ; $0032
                move.b  #$00, Obj_Timer(A2)                              ; $002A
                bset    #$01, Obj_Status(A2)                             ; $0022
Offset_0x0335AA:
                moveq   #$00, D6
                move.b  Obj_Control_Var_01(A0), D6                       ; $002D
Offset_0x0335B0:
                move.w  (A2)+, A1
                bsr     Jmp_04_To_DeleteObject_A1              ; Offset_0x03760E
                dbra    D6, Offset_0x0335B0
                bra     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC    
;-------------------------------------------------------------------------------
Load_Grabber_Sub_Obj_0xA9:                                     ; Offset_0x0335BE
                dc.w    Obj_Control_Var_12                               ; $003E
                dc.b    $A9, $3A
;-------------------------------------------------------------------------------
Load_Grabber_Sub_Obj_0xA8:                                     ; Offset_0x0335C2
                dc.w    Obj_Control_Var_10                               ; $003C
                dc.b    $A8, $38    
;-------------------------------------------------------------------------------
Load_Grabber_Sub_Obj_0xAA:                                     ; Offset_0x0335C6
                dc.w    Obj_Control_Var_0E                               ; $003A
                dc.b    $AA, $3C    
;-------------------------------------------------------------------------------                              
Obj_0xA7_Ptr:                                                  ; Offset_0x0335CA
                dc.l    Grabber_Mappings                       ; Offset_0x0335F8
                dc.w    $A500
                dc.b    $04, $04, $10, $0B      
;-------------------------------------------------------------------------------
Obj_0xA8_Ptr:                                                  ; Offset_0x0335D4
                dc.l    Grabber_Mappings                       ; Offset_0x0335F8
                dc.w    $A500
                dc.b    $04, $01, $10, $D7       
;-------------------------------------------------------------------------------    
Obj_0xA9_Ptr:                                                  ; Offset_0x0335DE
                dc.l    Grabber_Mappings                       ; Offset_0x0335F8
                dc.w    $A500
                dc.b    $04, $04, $04, $00         
;-------------------------------------------------------------------------------      
Obj_0xAA_Ptr:                                                  ; Offset_0x0335E8
                dc.l    Grabber_Mappings_01                    ; Offset_0x033606
                dc.w    $A500
                dc.b    $04, $05, $04, $00               
;-------------------------------------------------------------------------------  
Grabber_Animate_Data:                                          ; Offset_0x0335F2
                dc.w    Offset_0x0335F4-Grabber_Animate_Data
Offset_0x0335F4:
                dc.b    $07, $00, $01, $FF                               
;-------------------------------------------------------------------------------
Grabber_Mappings:                                              ; Offset_0x0335F8
                dc.w    Offset_0x033618-Grabber_Mappings
                dc.w    Offset_0x033632-Grabber_Mappings
                dc.w    Offset_0x03364C-Grabber_Mappings
                dc.w    Offset_0x033656-Grabber_Mappings
                dc.w    Offset_0x033660-Grabber_Mappings
                dc.w    Offset_0x03366A-Grabber_Mappings
                dc.w    Offset_0x033674-Grabber_Mappings  
Grabber_Mappings_01:                                           ; Offset_0x033606
                dc.w    Offset_0x03367E-Grabber_Mappings_01
                dc.w    Offset_0x033688-Grabber_Mappings_01
                dc.w    Offset_0x033692-Grabber_Mappings_01
                dc.w    Offset_0x0336A4-Grabber_Mappings_01
                dc.w    Offset_0x0336B6-Grabber_Mappings_01
                dc.w    Offset_0x0336EA-Grabber_Mappings_01
                dc.w    Offset_0x0336D0-Grabber_Mappings_01
                dc.w    Offset_0x03370C-Grabber_Mappings_01
                dc.w    Offset_0x03370C-Grabber_Mappings_01
;-------------------------------------------------------------------------------
Offset_0x033618:
                dc.w    $0003
                dc.l    $F8010000, $0000FFE5
                dc.l    $F80D0002, $0001FFED
                dc.l    $0809001D, $000EFFF1
Offset_0x033632:
                dc.w    $0003
                dc.l    $F8010000, $0000FFE5
                dc.l    $F80D0002, $0001FFED
                dc.l    $080D0023, $0011FFF1
Offset_0x03364C:
                dc.w    $0001
                dc.l    $FC00000A, $0005FFFC
Offset_0x033656:
                dc.w    $0001
                dc.l    $F809000F, $0007FFF9
Offset_0x033660:
                dc.w    $0001
                dc.l    $F80D0015, $000AFFF9
Offset_0x03366A:
                dc.w    $0001
                dc.l    $FC00002B, $0015FFFC
Offset_0x033674:
                dc.w    $0001
                dc.l    $FC00002C, $0016FFFC    
Offset_0x03367E:
                dc.w    $0001
                dc.l    $0001000B, $0005FFFC
Offset_0x033688:
                dc.w    $0001
                dc.l    $0003000B, $0005FFFC
Offset_0x033692:
                dc.w    $0002
                dc.l    $0001000B, $0005FFFC
                dc.l    $1003000B, $0005FFFC
Offset_0x0336A4:
                dc.w    $0002
                dc.l    $0003000B, $0005FFFC
                dc.l    $2003000B, $0005FFFC
Offset_0x0336B6:
                dc.w    $0003
                dc.l    $0001000B, $0005FFFC
                dc.l    $1003000B, $0005FFFC
                dc.l    $3003000B, $0005FFFC
Offset_0x0336D0:
                dc.w    $0003
                dc.l    $0003000B, $0005FFFC
                dc.l    $2003000B, $0005FFFC
                dc.l    $4003000B, $0005FFFC
Offset_0x0336EA:
                dc.w    $0004
                dc.l    $0001000B, $0005FFFC
                dc.l    $1003000B, $0005FFFC
                dc.l    $3003000B, $0005FFFC
                dc.l    $5003000B, $0005FFFC
Offset_0x03370C:
                dc.w    $0004
                dc.l    $0003000B, $0005FFFC
                dc.l    $2003000B, $0005FFFC
                dc.l    $4003000B, $0005FFFC
                dc.l    $6003000B, $0005FFFC
;-------------------------------------------------------------------------------
; Offset_0x03372E: ; Mapeamento não usado
                dc.w    $0005
                dc.l    $0001000B, $0005FFFC
                dc.l    $1003000B, $0005FFFC
                dc.l    $3003000B, $0005FFFC
                dc.l    $5003000B, $0005FFFC
                dc.l    $7003000B, $0005FFFC                
;===============================================================================   
; Objeto 0xAB - Inimigo Grabber na Chemical Plant
; <<<-          Objeto vinculado ao 0xA7
;===============================================================================