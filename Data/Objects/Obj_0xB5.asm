;===============================================================================
; Objeto 0xB5 - Hélice Horizontal na Sky Fortress
; ->>>        
;===============================================================================  
; Offset_0x035316:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x035324(PC, D0), D1
                jmp     Offset_0x035324(PC, D1)         
;-------------------------------------------------------------------------------     
Offset_0x035324:
                dc.w    Offset_0x03532A-Offset_0x035324
                dc.w    Offset_0x035346-Offset_0x035324
                dc.w    Offset_0x0353A0-Offset_0x035324
;-------------------------------------------------------------------------------    
Offset_0x03532A:
                bsr     Object_Settings                        ; Offset_0x030A30
                bsr     Offset_0x0356C0
                move.b  #$04, Obj_Ani_Number(A0)                         ; $001C
                move.b  Obj_Subtype(A0), D0                              ; $0028
                subi.b  #$5C, D0
                move.b  D0, Obj_Routine(A0)                              ; $0024
                rts
;-------------------------------------------------------------------------------                   
Offset_0x035346:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x035362(PC, D0), D1
                jsr     Offset_0x035362(PC, D1)
                lea     (Horizontal_Helix_Animate_Data), A1    ; Offset_0x035440
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608    
;-------------------------------------------------------------------------------    
Offset_0x035362:
                dc.w    Offset_0x035366-Offset_0x035362
                dc.w    Offset_0x035384-Offset_0x035362
;-------------------------------------------------------------------------------
Offset_0x035366:
                bsr     Offset_0x0353AE
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x035372
                rts
Offset_0x035372:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$05, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$0100, Obj_Timer(A0)                            ; $002A
                rts
;-------------------------------------------------------------------------------                
Offset_0x035384:
                bsr     Offset_0x0353AE
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x035390
                rts
Offset_0x035390:
                subq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                clr.b   Obj_Ani_Number(A0)                               ; $001C
                move.w  #$0100, Obj_Timer(A0)                            ; $002A
                rts
;-------------------------------------------------------------------------------                
Offset_0x0353A0:
                lea     (Horizontal_Helix_Animate_Data), A1    ; Offset_0x035440
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0353AE:
                cmpi.b  #$04, Obj_Ani_Number(A0)                         ; $001C
                bne.s   Offset_0x035434
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr     Offset_0x0353C2
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
Offset_0x0353C2:
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                addi.w  #$0040, D0
                cmpi.w  #$0080, D0
                bcc.s   Offset_0x035434
                moveq   #$00, D1
                move.b  ($FFFFFE74).w, D1
                add.w   Obj_Y(A1), D1                                    ; $000C
                addi.w  #$0060, D1
                sub.w   Obj_Y(A0), D1                                    ; $000C
                bcs.s   Offset_0x035434
                cmpi.w  #$0090, D1
                bcc.s   Offset_0x035434
                subi.w  #$0060, D1
                bcs.s   Offset_0x0353F8
                not.w   D1
                add.w   D1, D1
Offset_0x0353F8:
                addi.w  #$0060, D1
                neg.w   D1
                asr.w   #$04, D1
                add.w   D1, Obj_Y(A1)                                    ; $000C
                bset    #$01, Obj_Status(A1)                             ; $0022
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
                tst.b   Obj_Flip_Angle(A1)                               ; $0027
                bne.s   Offset_0x035434
                move.b  #$01, Obj_Flip_Angle(A1)                         ; $0027
                move.b  #$0F, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$7F, Obj_Control_Var_00(A1)                     ; $002C
                move.b  #$08, Obj_Control_Var_01(A1)                     ; $002D
Offset_0x035434:
                rts   
;-------------------------------------------------------------------------------    
Obj_0xB5_Ptr:                                                  ; Offset_0x035436
                dc.l    Horizontal_Helix_Mappings              ; Offset_0x0354A0
                dc.w    $A3CD
                dc.b    $04, $04, $40, $00    
;-------------------------------------------------------------------------------  
Horizontal_Helix_Animate_Data:                                 ; Offset_0x035440
                dc.w    Offset_0x035454-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03545E-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x035466-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03546E-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x035474-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03547C-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x035482-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03548A-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x035492-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03549C-Horizontal_Helix_Animate_Data
Offset_0x035454:
                dc.b    $07, $00, $01, $02, $03, $04, $05, $FD
                dc.b    $01, $00
Offset_0x03545E:
                dc.b    $04, $00, $01, $02, $03, $04, $FD, $02
Offset_0x035466:
                dc.b    $03, $05, $00, $01, $02, $FD, $03, $00
Offset_0x03546E:
                dc.b    $02, $03, $04, $05, $FD, $04
Offset_0x035474:
                dc.b    $01, $00, $01, $02, $03, $04, $05, $FF
Offset_0x03547C:
                dc.b    $02, $05, $04, $03, $FD, $06
Offset_0x035482:
                dc.b    $03, $02, $01, $00, $05, $FD, $07, $00
Offset_0x03548A:
                dc.b    $04, $04, $03, $02, $01, $00, $FD, $08
Offset_0x035492:
                dc.b    $07, $05, $04, $03, $02, $01, $00, $FD
                dc.b    $09, $00
Offset_0x03549C:
                dc.b    $7E, $00, $FF, $00
;-------------------------------------------------------------------------------  
Horizontal_Helix_Mappings:                                     ; Offset_0x0354A0
                dc.w    Offset_0x0354AC-Horizontal_Helix_Mappings
                dc.w    Offset_0x0354CE-Horizontal_Helix_Mappings
                dc.w    Offset_0x0354E0-Horizontal_Helix_Mappings
                dc.w    Offset_0x0354F2-Horizontal_Helix_Mappings
                dc.w    Offset_0x035504-Horizontal_Helix_Mappings
                dc.w    Offset_0x035516-Horizontal_Helix_Mappings
Offset_0x0354AC:
                dc.w    $0004
                dc.l    $FC0C0000, $0000FFC0
                dc.l    $FC080004, $0002FFE0
                dc.l    $FC080007, $00030008
                dc.l    $FC0C000A, $00050020
Offset_0x0354CE:
                dc.w    $0002
                dc.l    $FC0C000E, $0007FFD8
                dc.l    $FC0C0012, $00090008
Offset_0x0354E0:
                dc.w    $0002
                dc.l    $FC080016, $000BFFE8
                dc.l    $FC040019, $000C0008
Offset_0x0354F2:
                dc.w    $0002
                dc.l    $FC04001B, $000DFFF0
                dc.l    $FC04081B, $080D0000
Offset_0x035504:
                dc.w    $0002
                dc.l    $FC040819, $080CFFE8
                dc.l    $FC080816, $080B0000
Offset_0x035516:
                dc.w    $0002
                dc.l    $FC0C0812, $0809FFD8
                dc.l    $FC0C080E, $08070008                                                                                          
;===============================================================================   
; Objeto 0xB5 - Hélice Horizontal na Sky Fortress
; <<<-        
;===============================================================================