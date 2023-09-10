;===============================================================================
; Objeto 0xA7 - Inimigo Grabber (aranha) na Chemical Plant
; ->>>        
;===============================================================================     
; Offset_0x0331A2:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0331B0(PC, D0), D1
                jmp     Offset_0x0331B0(PC, D1)    
;-------------------------------------------------------------------------------    
Offset_0x0331B0:
                dc.w    Offset_0x0331B4-Offset_0x0331B0
                dc.w    Offset_0x0331F4-Offset_0x0331B0     
;-------------------------------------------------------------------------------  
Offset_0x0331B4:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.w  #$FFC0, D0
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x0331C6
                neg.w   D0
Offset_0x0331C6:
                move.w  D0, Obj_Speed(A0)                                ; $0010
                move.w  #$00FF, Obj_Timer(A0)                            ; $002A
                move.b  #$02, Obj_Control_Var_01(A0)                     ; $002D
                lea     (Load_Grabber_Sub_Obj_0xA9), A2        ; Offset_0x0335BE
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                lea     (Load_Grabber_Sub_Obj_0xA8), A2        ; Offset_0x0335C2
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                lea     (Load_Grabber_Sub_Obj_0xAA), A2        ; Offset_0x0335C6
                bra     Load_Sub_Obj                           ; Offset_0x030BE4  
;-------------------------------------------------------------------------------
Offset_0x0331F4:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x03322E(PC, D0), D1
                jsr     Offset_0x03322E(PC, D1)
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                moveq   #$00, D0
                moveq   #$10, D1
                move.w  Obj_Control_Var_10(A0), A1                       ; $003C
                bsr     Offset_0x030C0A
                move.w  Obj_Control_Var_12(A0), A1                       ; $003E
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Control_Var_0E(A0), A1                       ; $003A
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                lea     Obj_Control_Var_0E(A0), A2                       ; $003A
                bra     Obj_0xA7_Sub_02                        ; Offset_0x033560    
;-------------------------------------------------------------------------------                       
Offset_0x03322E:
                dc.w    Offset_0x03323A-Offset_0x03322E
                dc.w    Offset_0x033282-Offset_0x03322E
                dc.w    Offset_0x03329C-Offset_0x03322E
                dc.w    Offset_0x033326-Offset_0x03322E
                dc.w    Offset_0x033340-Offset_0x03322E
                dc.w    Offset_0x03334A-Offset_0x03322E  
;------------------------------------------------------------------------------- 
Offset_0x03323A:
                bsr     Offset_0x030B18
                addi.w  #$0040, D2
                cmpi.w  #$0080, D2
                bcc.s   Offset_0x03324E
                cmpi.w  #$FF80, D3
                bhi.s   Offset_0x03326C
Offset_0x03324E:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bpl.s   Offset_0x03326A
                move.w  #$00FF, Obj_Timer(A0)                            ; $002A
                neg.w   Obj_Speed(A0)                                    ; $0010
                bchg    #00, Obj_Flags(A0)                               ; $0001
                bchg    #00, Obj_Status(A0)                              ; $0022
Offset_0x03326A:
                rts
Offset_0x03326C:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  Obj_Speed(A0), Obj_Control_Var_02(A0)     ; $0010, $002E
                clr.w   Obj_Speed(A0)                                    ; $0010
                move.b  #$10, Obj_Control_Var_00(A0)                     ; $002C
                rts      
;-------------------------------------------------------------------------------
Offset_0x033282:
                subq.b  #$01, Obj_Control_Var_00(A0)                     ; $002C
                bmi.s   Offset_0x03328A
                rts
Offset_0x03328A:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0200, Obj_Speed_Y(A0)                          ; $0012
                move.b  #$40, Obj_Control_Var_00(A0)                     ; $002C
                rts  
;-------------------------------------------------------------------------------
Offset_0x03329C:
                tst.b   Obj_Control_Var_04(A0)                           ; $0030
                bne.s   Offset_0x0332D6
                subq.b  #$01, Obj_Control_Var_00(A0)                     ; $002C
                beq.s   Offset_0x0332BE
                cmpi.b  #$20, Obj_Control_Var_00(A0)                     ; $002C
                bne.s   Offset_0x0332B4
                neg.w   Obj_Speed_Y(A0)                                  ; $0012
Offset_0x0332B4:
                lea     (Grabber_Animate_Data), A1             ; Offset_0x0335F2
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
Offset_0x0332BE:
                move.b  #$00, Obj_Routine_2(A0)                          ; $0025
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                move.w  Obj_Control_Var_02(A0), Obj_Speed(A0)     ; $0010, $002E
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                rts
Offset_0x0332D6:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  Obj_Control_Var_06(A0), A1                       ; $0032
                move.b  #$81, Obj_Timer(A1)                              ; $002A
                clr.w   Obj_Speed(A1)                                    ; $0010
                clr.w   Obj_Speed_Y(A1)                                  ; $0012
                move.b  #$0E, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x033312
                neg.w   Obj_Speed_Y(A0)                                  ; $0012
                move.b  Obj_Control_Var_00(A0), D0                       ; $002C
                subi.b  #$40, D0
                neg.w   D0
                addq.b  #$01, D0
                move.b  D0, Obj_Control_Var_00(A0)                       ; $002C
Offset_0x033312:
                move.b  #$01, Obj_Timer(A0)                              ; $002A
                move.b  #$10, Obj_Player_Status(A0)                      ; $002B
                move.b  #$20, Obj_Control_Var_0B(A0)                     ; $0037
                rts  
;-------------------------------------------------------------------------------
Offset_0x033326:
                bsr     Obj_0xA7_Sub_01                        ; Offset_0x033518
                bsr     Obj_0xA7_Sub                           ; Offset_0x03349A
                subq.b  #$01, Obj_Control_Var_00(A0)                     ; $002C
                beq.s   Offset_0x033336
                rts
Offset_0x033336:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                rts 
;-------------------------------------------------------------------------------
Offset_0x033340:
                bsr     Obj_0xA7_Sub_01                        ; Offset_0x033518
                bra     Obj_0xA7_Sub                           ; Offset_0x03349A  
                rts   
;-------------------------------------------------------------------------------
Offset_0x03334A:
                bra     Obj_0xA7_Sub_01                        ; Offset_0x033518
;===============================================================================   
; Objeto 0xA7 - Inimigo Grabber (aranha) na Chemical Plant
; <<<-        
;===============================================================================