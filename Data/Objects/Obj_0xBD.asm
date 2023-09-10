;===============================================================================
; Objeto 0xBD - Elevadores na Sky Fortress
; ->>>
;===============================================================================
; Offset_0x035B42:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x035B50(PC, D0), D1
                jmp     Offset_0x035B50(PC, D1)     
;-------------------------------------------------------------------------------   
Offset_0x035B50:
                dc.w    Offset_0x035B56-Offset_0x035B50
                dc.w    Offset_0x035B62-Offset_0x035B50
                dc.w    Offset_0x035B76-Offset_0x035B50
;-------------------------------------------------------------------------------  
Offset_0x035B56:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0001, Obj_Timer(A0)                            ; $002A
                rts
;-------------------------------------------------------------------------------                  
Offset_0x035B62:    
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bne.s   Offset_0x035B72
                move.w  #$0040, Obj_Timer(A0)                            ; $002A
                bsr     Offset_0x035C06
Offset_0x035B72:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                  
Offset_0x035B76:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x035B88(PC, D0), D1
                jsr     Offset_0x035B88(PC, D1)
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608     
;-------------------------------------------------------------------------------  
Offset_0x035B88:
                dc.w    Offset_0x035B92-Offset_0x035B88
                dc.w    Offset_0x035BBE-Offset_0x035B88
                dc.w    Offset_0x035BC8-Offset_0x035B88
                dc.w    Offset_0x035BDE-Offset_0x035B88
                dc.w    Offset_0x035BE8-Offset_0x035B88
;-------------------------------------------------------------------------------  
Offset_0x035B92:
                bsr     Object_Settings                        ; Offset_0x030A30
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$00C7, Obj_Timer(A0)                            ; $002A
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                subi.b  #$76, D0
                move.b  D0, Obj_Subtype(A0)                              ; $0028
                move.w  Offset_0x035BBA(PC, D0), Obj_Speed_Y(A0)         ; $0012
                rts   
;------------------------------------------------------------------------------- 
Offset_0x035BBA:
                dc.w    $FF00, $0100
;------------------------------------------------------------------------------- 
Offset_0x035BBE:
                lea     (SFz_Elevators_Animate_Data), A1       ; Offset_0x035C36
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
;-------------------------------------------------------------------------------                 
Offset_0x035BC8:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x035BD2
                bra     Offset_0x035BEC
Offset_0x035BD2:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                rts
;-------------------------------------------------------------------------------                
Offset_0x035BDE:
                lea     (SFz_Elevators_Animate_Data), A1       ; Offset_0x035C36
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
;-------------------------------------------------------------------------------                 
Offset_0x035BE8:
                bra     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
Offset_0x035BEC:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                move.w  #$0023, D1
                move.w  #$0004, D2
                move.w  #$0005, D3
                move.w  (A7)+, D4
                bra     Jmp_04_To_Platform_Object              ; Offset_0x037644
Offset_0x035C06:
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x035C2A
                move.b  #$BD, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.b  Obj_Subtype(A0), Obj_Subtype(A1)          ; $0028, $0028
Offset_0x035C2A:
                rts   
;-------------------------------------------------------------------------------
Obj_0xBD_Ptr:                                                  ; Offset_0x035C2C
                dc.l    SFz_Elevators_Mappings                 ; Offset_0x035C46
                dc.w    $E416
                dc.b    $04, $04, $18, $00
;-------------------------------------------------------------------------------
SFz_Elevators_Animate_Data:                                    ; Offset_0x035C36
                dc.w    Offset_0x035C3A-SFz_Elevators_Animate_Data
                dc.w    Offset_0x035C40-SFz_Elevators_Animate_Data
Offset_0x035C3A:
                dc.b    $03, $02, $01, $00, $FA, $00      
Offset_0x035C40:
                dc.b    $01, $00, $01, $02, $FA, $00    
;-------------------------------------------------------------------------------  
SFz_Elevators_Mappings:                                        ; Offset_0x035C46
                dc.w    Offset_0x035C4C-SFz_Elevators_Mappings
                dc.w    Offset_0x035C5E-SFz_Elevators_Mappings
                dc.w    Offset_0x035C70-SFz_Elevators_Mappings
Offset_0x035C4C:
                dc.w    $0002
                dc.l    $FC080000, $0000FFE8
                dc.l    $FC080003, $00010000
Offset_0x035C5E:
                dc.w    $0002
                dc.l    $FC080006, $0003FFE8
                dc.l    $FC080806, $08030000
Offset_0x035C70:
                dc.w    $0002
                dc.l    $FC080009, $0004FFE8
                dc.l    $FC080809, $08040000                                                                                                                                                                                  
;===============================================================================
; Objeto 0xBD - Elevadores na Sky Fortress
; <<<-
;===============================================================================