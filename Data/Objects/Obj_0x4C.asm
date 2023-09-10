;===============================================================================
; Objeto 0x4C - Batbot - Inimigo Morcego na Hidden Palace
; ->>>          
;===============================================================================  
; Offset_0x027504:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x027512(PC, D0), D1
                jmp     Offset_0x027512(PC, D1)       
;-------------------------------------------------------------------------------    
Offset_0x027512:
                dc.w    Offset_0x027518-Offset_0x027512
                dc.w    Offset_0x027556-Offset_0x027512
                dc.w    Offset_0x0275C4-Offset_0x027512           
;-------------------------------------------------------------------------------    
Offset_0x027518:
                move.l  #Batbot_Mappings, Obj_Map(A0)   ; Offset_0x0277A2, $0004
                move.w  #$2530, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$0A, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$10, Obj_Height_2(A0)                           ; $0016
                move.b  #$08, Obj_Width_2(A0)                            ; $0017
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  Obj_Y(A0), Obj_Control_Var_02(A0)         ; $000C, $002E
                rts        
;-------------------------------------------------------------------------------  
Offset_0x027556:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x027576(PC, D0), D1
                jsr     Offset_0x027576(PC, D1)
                bsr     Offset_0x02757C
                lea     (Batbot_Animate_Data), A1              ; Offset_0x02776E
                bsr     Jmp_0A_To_AnimateSprite                ; Offset_0x02797E
                bra     Jmp_1E_To_MarkObjGone                  ; Offset_0x027978                    
;-------------------------------------------------------------------------------  
Offset_0x027576:
                dc.w    Offset_0x0276E2-Offset_0x027576
                dc.w    Offset_0x02771A-Offset_0x027576
                dc.w    Offset_0x027726-Offset_0x027576     
;-------------------------------------------------------------------------------  
Offset_0x02757C:
                move.b  Obj_Control_Var_13(A0), D0                       ; $003F
                jsr     (CalcSine)                             ; Offset_0x00396A
                asr.w   #$06, D0
                add.w   Obj_Control_Var_02(A0), D0                       ; $002E
                move.w  D0, Obj_Y(A0)                                    ; $000C
                addq.b  #$04, Obj_Control_Var_13(A0)                     ; $003F
                rts                
;-------------------------------------------------------------------------------    
Offset_0x027596:
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   ($FFFFB008).w, D0
                cmpi.w  #$0080, D0
                bgt.s   Offset_0x0275C2
                cmpi.w  #$FF80, D0
                blt.s   Offset_0x0275C2
                move.b  #$04, Obj_Routine_2(A0)                          ; $0025
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$0008, Obj_Timer(A0)                            ; $002A
                move.b  #$00, Obj_Control_Var_12(A0)                     ; $003E
Offset_0x0275C2:
                rts  
;------------------------------------------------------------------------------- 
Offset_0x0275C4:
                bsr     Offset_0x0276C2
                bsr     Offset_0x027664
                bsr     Offset_0x0275E4
                bsr     Jmp_11_To_SpeedToPos                   ; Offset_0x027984
                lea     (Batbot_Animate_Data), A1              ; Offset_0x02776E
                bsr     Jmp_0A_To_AnimateSprite                ; Offset_0x02797E
                bra     Jmp_1E_To_MarkObjGone                  ; Offset_0x027978            
;-------------------------------------------------------------------------------    
; Offset_0x0275E2:
                rts
Offset_0x0275E4:
                tst.b   Obj_Control_Var_11(A0)                           ; $003D
                beq.s   Offset_0x0275F6
                bset    #$00, Obj_Flags(A0)                              ; $0001
                bset    #$00, Obj_Status(A0)                             ; $0022
Offset_0x0275F6:
                rts    
;-------------------------------------------------------------------------------  
Offset_0x0275F8:
                subi.w  #$0001, Obj_Control_Var_00(A0)                   ; $002C
                bpl.s   Offset_0x027642
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   ($FFFFB008).w, D0
                cmpi.w  #$0060, D0
                bgt.s   Offset_0x027644
                cmpi.w  #$FFA0, D0
                blt.s   Offset_0x027644
                tst.w   D0
                bpl.s   Offset_0x02761C
                st      Obj_Control_Var_11(A0)                           ; $003D
Offset_0x02761C:
                move.b  #$40, Obj_Control_Var_13(A0)                     ; $003F
                move.w  #$0400, Obj_Inertia(A0)                          ; $0014
                move.b  #$04, Obj_Routine(A0)                            ; $0024
                move.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$000C, Obj_Timer(A0)                            ; $002A
                move.b  #$01, Obj_Control_Var_12(A0)                     ; $003E
                moveq   #$00, D0
Offset_0x027642:
                rts
Offset_0x027644:
                cmpi.w  #$0080, D0
                bgt.s   Offset_0x027650
                cmpi.w  #$FF80, D0
                bgt.s   Offset_0x027642
Offset_0x027650:
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$00, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0018, Obj_Timer(A0)                            ; $002A
                rts
Offset_0x027664:
                tst.b   Obj_Control_Var_11(A0)                           ; $003D
                bne.s   Offset_0x02767E
                moveq   #$00, D0
                move.b  Obj_Control_Var_13(A0), D0                       ; $003F
                cmpi.w  #$00C0, D0
                bge.s   Offset_0x027692
                addq.b  #$02, D0
                move.b  D0, Obj_Control_Var_13(A0)                       ; $003F
                rts
Offset_0x02767E:
                moveq   #$00, D0
                move.b  Obj_Control_Var_13(A0), D0                       ; $003F
                cmpi.w  #$00C0, D0
                beq.s   Offset_0x027692
                subq.b  #$02, D0
                move.b  D0, Obj_Control_Var_13(A0)                       ; $003F
                rts
Offset_0x027692:
                sf      Obj_Control_Var_11(A0)                           ; $003D
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$00, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0018, Obj_Timer(A0)                            ; $002A
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                bclr    #$00, Obj_Status(A0)                             ; $0022
                rts
Offset_0x0276C2:
                move.b  Obj_Control_Var_13(A0), D0                       ; $003F
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  Obj_Inertia(A0), D1                              ; $0014
                asr.l   #$08, D1
                move.w  D1, Obj_Speed(A0)                                ; $0010
                muls.w  Obj_Inertia(A0), D0                              ; $0014
                asr.l   #$08, D0
                move.w  D0, Obj_Speed_Y(A0)                              ; $0012
                rts
;-------------------------------------------------------------------------------                
Offset_0x0276E2:
                subi.w  #$0001, Obj_Timer(A0)                            ; $002A
                bpl.s   Offset_0x027718
                bsr     Offset_0x027596
                beq.s   Offset_0x027718
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                andi.b  #$FF, D0
                bne.s   Offset_0x027718
                move.w  #$0018, Obj_Timer(A0)                            ; $002A
                move.w  #$001E, Obj_Control_Var_00(A0)                   ; $002C
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$00, Obj_Control_Var_12(A0)                     ; $003E
Offset_0x027718:
                rts 
;-------------------------------------------------------------------------------  
Offset_0x02771A:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bpl.s   Offset_0x027724
                subq.b  #$02, Obj_Routine_2(A0)                          ; $0025
Offset_0x027724:
                rts  
;-------------------------------------------------------------------------------  
Offset_0x027726:
                bsr     Offset_0x0275F8
                beq.s   Offset_0x02776C
                subi.w  #$0001, Obj_Timer(A0)                            ; $002A
                bne.s   Offset_0x02776C
                move.b  Obj_Control_Var_12(A0), D0                       ; $003E
                beq.s   Offset_0x027754
                move.b  #$00, Obj_Control_Var_12(A0)                     ; $003E
                move.w  #$0008, Obj_Timer(A0)                            ; $002A
                bset    #$00, Obj_Flags(A0)                              ; $0001
                bset    #$00, Obj_Status(A0)                             ; $0022
                rts
Offset_0x027754:
                move.b  #$01, Obj_Control_Var_12(A0)                     ; $003E
                move.w  #$000C, Obj_Timer(A0)                            ; $002A
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                bclr    #$00, Obj_Status(A0)                             ; $0022
Offset_0x02776C:
                rts     
;-------------------------------------------------------------------------------    
Batbot_Animate_Data:                                           ; Offset_0x02776E
                dc.w    Offset_0x027776-Batbot_Animate_Data
                dc.w    Offset_0x02777A-Batbot_Animate_Data
                dc.w    Offset_0x027789-Batbot_Animate_Data
                dc.w    Offset_0x02779A-Batbot_Animate_Data
Offset_0x027776:
                dc.b    $01, $00, $05, $FF
Offset_0x02777A:
                dc.b    $01, $01, $06, $01, $06, $02, $07, $02
                dc.b    $07, $01, $06, $01, $06, $FD, $00
Offset_0x027789:
                dc.b    $01, $01, $06, $01, $06, $02, $07, $03
                dc.b    $08, $04, $09, $04, $09, $03, $08, $FE
                dc.b    $0A
Offset_0x02779A:
                dc.b    $03, $0A, $0B, $0C, $0D, $0E, $FF, $00    
;------------------------------------------------------------------------------- 
Batbot_Mappings:                                               ; Offset_0x0277A2
                dc.w    Offset_0x0277C0-Batbot_Mappings
                dc.w    Offset_0x0277E2-Batbot_Mappings
                dc.w    Offset_0x027804-Batbot_Mappings
                dc.w    Offset_0x027826-Batbot_Mappings
                dc.w    Offset_0x027848-Batbot_Mappings
                dc.w    Offset_0x027862-Batbot_Mappings
                dc.w    Offset_0x027884-Batbot_Mappings
                dc.w    Offset_0x0278A6-Batbot_Mappings
                dc.w    Offset_0x0278C8-Batbot_Mappings
                dc.w    Offset_0x0278EA-Batbot_Mappings
                dc.w    Offset_0x027904-Batbot_Mappings
                dc.w    Offset_0x02791E-Batbot_Mappings
                dc.w    Offset_0x027938-Batbot_Mappings
                dc.w    Offset_0x02794A-Batbot_Mappings
                dc.w    Offset_0x02795C-Batbot_Mappings
Offset_0x0277C0:
                dc.w    $0004
                dc.l    $F0050000, $0000FFF8
                dc.l    $00050004, $0002FFF8
                dc.l    $F00B0008, $00040005
                dc.l    $F00B0808, $0804FFE3
Offset_0x0277E2:
                dc.w    $0004
                dc.l    $F0050000, $0000FFF8
                dc.l    $00050004, $0002FFF8
                dc.l    $F60D0014, $000A0005
                dc.l    $F60D0814, $080AFFDB
Offset_0x027804:
                dc.w    $0004
                dc.l    $F0050000, $0000FFF8
                dc.l    $00050004, $0002FFF8
                dc.l    $F80D001C, $000E0004
                dc.l    $F80D081C, $080EFFDC
Offset_0x027826:
                dc.w    $0004
                dc.l    $F0050000, $0000FFF8
                dc.l    $00050004, $0002FFF8
                dc.l    $F8050024, $0012FFEC
                dc.l    $F8050028, $00140004
Offset_0x027848:
                dc.w    $0003
                dc.l    $F801002C, $00160000
                dc.l    $F0050000, $0000FFF8
                dc.l    $00050004, $0002FFF8
Offset_0x027862:
                dc.w    $0004
                dc.l    $F0050000, $0000FFF8
                dc.l    $0005002E, $0017FFF8
                dc.l    $F00B0008, $00040005
                dc.l    $F00B0808, $0804FFE3
Offset_0x027884:
                dc.w    $0004
                dc.l    $F0050000, $0000FFF8
                dc.l    $0005002E, $0017FFF8
                dc.l    $F60D0014, $000A0005
                dc.l    $F60D0814, $080AFFDB
Offset_0x0278A6:
                dc.w    $0004
                dc.l    $F0050000, $0000FFF8
                dc.l    $0005002E, $0017FFF8
                dc.l    $F80D001C, $000E0004
                dc.l    $F80D081C, $080EFFDC
Offset_0x0278C8:
                dc.w    $0004
                dc.l    $F0050000, $0000FFF8
                dc.l    $0005002E, $0017FFF8
                dc.l    $F8050028, $00140004
                dc.l    $F8050024, $0012FFEC
Offset_0x0278EA:
                dc.w    $0003
                dc.l    $F801002C, $00160000
                dc.l    $F0050000, $0000FFF8
                dc.l    $0005002E, $0017FFF8                                    
Offset_0x027904:
                dc.w    $0003
                dc.l    $F0070032, $0019FFF8
                dc.l    $F80D001C, $000E0004
                dc.l    $F80D081C, $080EFFDC
Offset_0x02791E:
                dc.w    $0003
                dc.l    $F0070032, $0019FFF8
                dc.l    $F8050028, $00140004
                dc.l    $F8050024, $0012FFEC
Offset_0x027938:
                dc.w    $0002
                dc.l    $F801002C, $00160000
                dc.l    $F0070032, $0019FFF8
Offset_0x02794A:
                dc.w    $0002
                dc.l    $F801082C, $0816FFF8
                dc.l    $F0070032, $0019FFF8                                     
Offset_0x02795C:
                dc.w    $0003
                dc.l    $F0070032, $0019FFF8
                dc.l    $F8050828, $0814FFEC
                dc.l    $F8050824, $08120004
;===============================================================================   
; Objeto 0x4C - Batbot - Inimigo Morcego na Hidden Palace
; <<<-
;===============================================================================