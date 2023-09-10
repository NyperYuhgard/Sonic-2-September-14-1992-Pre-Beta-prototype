;===============================================================================
; Objeto 0x4F - Dinobot - Inimigo dinossauro na Hidden Palace
; ->>>        
;===============================================================================     
; Offset_0x027F34:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x027F42(PC, D0), D1
                jmp     Offset_0x027F42(PC, D1)    
;-------------------------------------------------------------------------------   
Offset_0x027F42:
                dc.w    Offset_0x027F48-Offset_0x027F42
                dc.w    Offset_0x027F9E-Offset_0x027F42
                dc.w    Offset_0x028040-Offset_0x027F42       
;-------------------------------------------------------------------------------   
Offset_0x027F48:
                move.l  #Dinobot_Mappings, Obj_Map(A0)  ; Offset_0x028052, $0004
                move.w  #$0500, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$10, Obj_Height_2(A0)                           ; $0016
                move.b  #$06, Obj_Width_2(A0)                            ; $0017
                move.b  #$0C, Obj_Col_Flags(A0)                          ; $0020
                bsr     Jmp_03_To_ObjectFall                   ; Offset_0x02808A
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x027F9C
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bchg    #00, Obj_Status(A0)                              ; $0022
Offset_0x027F9C:
                rts     
;-------------------------------------------------------------------------------  
Offset_0x027F9E:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x027FE4(PC, D0), D1
                jsr     Offset_0x027FE4(PC, D1)
                lea     (Dinobot_Animate_Data), A1             ; Offset_0x028044
                bsr     Jmp_0D_To_AnimateSprite                ; Offset_0x028084
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x027FCE
                bra     Jmp_18_To_DisplaySprite                ; Offset_0x028078
Offset_0x027FCE:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x027FE0
                bclr    #$07, $02(A2, D0)
Offset_0x027FE0:
                bra     Jmp_1A_To_DeleteObject                 ; Offset_0x02807E    
;-------------------------------------------------------------------------------     
Offset_0x027FE4:
                dc.w    Offset_0x027FE8-Offset_0x027FE4
                dc.w    Offset_0x02800C-Offset_0x027FE4           
;-------------------------------------------------------------------------------      
Offset_0x027FE8:
                subq.w  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bpl.s   Offset_0x02800A
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$FF80, Obj_Speed(A0)                            ; $0010
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                bchg    #00, Obj_Status(A0)                              ; $0022
                bne.s   Offset_0x02800A
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x02800A:
                rts  
;-------------------------------------------------------------------------------  
Offset_0x02800C:
                bsr     Jmp_13_To_SpeedToPos                   ; Offset_0x028090
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                cmpi.w  #$FFF8, D1
                blt.s   Offset_0x028028
                cmpi.w  #$000C, D1
                bge.s   Offset_0x028028
                add.w   D1, Obj_Y(A0)                                    ; $000C
                rts
Offset_0x028028:
                subq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$003B, Obj_Control_Var_04(A0)                   ; $0030
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                rts  
;-------------------------------------------------------------------------------  
Offset_0x028040:
                bra     Jmp_1A_To_DeleteObject                 ; Offset_0x02807E           
;-------------------------------------------------------------------------------
Dinobot_Animate_Data:                                          ; Offset_0x028044
                dc.w    Offset_0x028048-Dinobot_Animate_Data
                dc.w    Offset_0x02804B-Dinobot_Animate_Data
Offset_0x028048:
                dc.b    $09, $01, $FF
Offset_0x02804B:
                dc.b    $09, $00, $01, $02, $01, $FF, $00     
;-------------------------------------------------------------------------------
Dinobot_Mappings:                                              ; Offset_0x028052
                dc.w    Offset_0x028058-Dinobot_Mappings
                dc.w    Offset_0x028062-Dinobot_Mappings
                dc.w    Offset_0x02806C-Dinobot_Mappings
Offset_0x028058:
                dc.w    $0001
                dc.l    $F00F0000, $0000FFF0
Offset_0x028062:
                dc.w    $0001
                dc.l    $F00F0010, $0008FFF0
Offset_0x02806C:
                dc.w    $0001
                dc.l    $F00F0020, $0010FFF0
;===============================================================================   
; Objeto 0x4F - Dinobot - Inimigo dinossauro na Hidden Palace
; <<<-        
;===============================================================================