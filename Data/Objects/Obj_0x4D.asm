;===============================================================================
; Objeto 0x4D - Rhinobot - Inimigo rinoceronte na Hidden Palace
; ->>> 
;===============================================================================
; Offset_0x02863C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x02864A(PC, D0), D1
                jmp     Offset_0x02864A(PC, D1)                   
;-------------------------------------------------------------------------------    
Offset_0x02864A:
                dc.w    Offset_0x02864E-Offset_0x02864A
                dc.w    Offset_0x02869E-Offset_0x02864A          
;-------------------------------------------------------------------------------     
Offset_0x02864E:
                move.l  #Rhinobot_Mappings, Obj_Map(A0) ; Offset_0x0287A6, $0004
                move.w  #$23B2, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$0A, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$18, Obj_Width(A0)                              ; $0019
                move.b  #$10, Obj_Height_2(A0)                           ; $0016
                move.b  #$18, Obj_Width_2(A0)                            ; $0017
                bsr     Jmp_05_To_ObjectFall                   ; Offset_0x028904
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x02869C
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x02869C:
                rts    
;------------------------------------------------------------------------------- 
Offset_0x02869E:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x0286BA(PC, D0), D1
                jsr     Offset_0x0286BA(PC, D1)
                lea     (Rhinobot_Animate_Data), A1            ; Offset_0x02878A
                bsr     Jmp_0F_To_AnimateSprite                ; Offset_0x0288FE
                bra     Jmp_22_To_MarkObjGone                  ; Offset_0x0288F8  
;-------------------------------------------------------------------------------      
Offset_0x0286BA:
                dc.w    Offset_0x0286BE-Offset_0x0286BA
                dc.w    Offset_0x0286E2-Offset_0x0286BA     
;-------------------------------------------------------------------------------    
Offset_0x0286BE:
                subq.w  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bpl.s   Offset_0x0286E0
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$FF80, Obj_Speed(A0)                            ; $0010
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                bchg    #00, Obj_Status(A0)                              ; $0022
                bne.s   Offset_0x0286E0
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x0286E0:
                rts  
;-------------------------------------------------------------------------------    
Offset_0x0286E2:
                bsr     Offset_0x02872C
                bsr     Jmp_05_To_ObjectFall                   ; Offset_0x028904
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                cmpi.w  #$FFF8, D1
                blt.s   Offset_0x028708
                cmpi.w  #$000C, D1
                bge.s   Offset_0x028706
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                add.w   D1, Obj_Y(A0)                                    ; $000C
Offset_0x028706:
                rts
Offset_0x028708:
                subq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$003B, Obj_Control_Var_04(A0)                   ; $0030
                move.w  Obj_Speed(A0), D0                                ; $0010
                ext.l   D0
                asl.l   #$08, D0
                sub.l   D0, Obj_X(A0)                                    ; $0008
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                rts
Offset_0x02872C:
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   ($FFFFB008).w, D0
                bmi.s   Offset_0x028760
                cmpi.w  #$0060, D0
                bgt.s   Offset_0x028750
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x028752
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$FE00, Obj_Speed(A0)                            ; $0010
Offset_0x028750:
                rts
Offset_0x028752:
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$0080, Obj_Speed(A0)                            ; $0010
                rts
Offset_0x028760:
                cmpi.w  #$FFA0, D0
                blt.s   Offset_0x028750
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02877C
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$0200, Obj_Speed(A0)                            ; $0010
                rts
Offset_0x02877C:
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$FF80, Obj_Speed(A0)                            ; $0010
                rts                                         
;-------------------------------------------------------------------------------
Rhinobot_Animate_Data:                                         ; Offset_0x02878A
                dc.w    Offset_0x028790-Rhinobot_Animate_Data
                dc.w    Offset_0x02879E-Rhinobot_Animate_Data
                dc.w    Offset_0x0287A1-Rhinobot_Animate_Data
Offset_0x028790:
                dc.b    $02, $00, $00, $00, $03, $03, $04, $01
                dc.b    $01, $02, $05, $05, $05, $FF
Offset_0x02879E:
                dc.b    $0F, $00, $FF
Offset_0x0287A1:
                dc.b    $02, $06, $07, $FF, $00              
;------------------------------------------------------------------------------- 
Rhinobot_Mappings:                                             ; Offset_0x0287A6
                dc.w    Offset_0x0287B6-Rhinobot_Mappings
                dc.w    Offset_0x0287E0-Rhinobot_Mappings
                dc.w    Offset_0x02880A-Rhinobot_Mappings
                dc.w    Offset_0x028834-Rhinobot_Mappings
                dc.w    Offset_0x02885E-Rhinobot_Mappings
                dc.w    Offset_0x028888-Rhinobot_Mappings
                dc.w    Offset_0x0288B2-Rhinobot_Mappings
                dc.w    Offset_0x0288D4-Rhinobot_Mappings
Offset_0x0287B6:
                dc.w    $0005
                dc.l    $F0050000, $0000FFF0
                dc.l    $F0050004, $00020000
                dc.l    $F8010008, $0004FFE8
                dc.l    $0005000A, $0005FFF0
                dc.l    $00090022, $00110000
Offset_0x0287E0:
                dc.w    $0005
                dc.l    $F0050000, $0000FFF0
                dc.l    $F0050004, $00020000
                dc.l    $F8010008, $0004FFE8
                dc.l    $0005000E, $0007FFF0
                dc.l    $00090022, $00110000
Offset_0x02880A:
                dc.w    $0005
                dc.l    $F0050000, $0000FFF0
                dc.l    $F0050004, $00020000
                dc.l    $F8010008, $0004FFE8
                dc.l    $00050012, $0009FFF0
                dc.l    $00090022, $00110000
Offset_0x028834:
                dc.w    $0005
                dc.l    $F0050000, $0000FFF0
                dc.l    $F0050004, $00020000
                dc.l    $F8010008, $0004FFE8
                dc.l    $0005000A, $0005FFF0
                dc.l    $00090028, $00140000
Offset_0x02885E:
                dc.w    $0005
                dc.l    $F0050000, $0000FFF0
                dc.l    $F0050004, $00020000
                dc.l    $F8010008, $0004FFE8
                dc.l    $0005000E, $0007FFF0
                dc.l    $00090028, $00140000                                      
Offset_0x028888:
                dc.w    $0005
                dc.l    $F0050000, $0000FFF0
                dc.l    $F0050004, $00020000
                dc.l    $F8010008, $0004FFE8
                dc.l    $00050012, $0009FFF0
                dc.l    $00090028, $00140000
Offset_0x0288B2:
                dc.w    $0004
                dc.l    $F00B0016, $000BFFE8
                dc.l    $F0050004, $00020000
                dc.l    $00090022, $00110000
                dc.l    $FB01002E, $0017001A
Offset_0x0288D4:
                dc.w    $0004
                dc.l    $F00B0016, $000BFFE8
                dc.l    $F0050004, $00020000
                dc.l    $00090028, $00140000
                dc.l    $FB010030, $0018001A
;===============================================================================
; Objeto 0x4D - Rhinobot - Inimigo rinoceronte na Hidden Palace
; <<<- 
;===============================================================================