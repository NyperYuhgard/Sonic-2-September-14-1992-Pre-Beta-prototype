;===============================================================================
; Objeto 0x8C -> Moscas na Neo Green Hill
; ->>>          
;===============================================================================  
Offset_0x030D9A:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x030DA8(PC, D0), D1
                jmp     Offset_0x030DA8(PC, D1)   
;-------------------------------------------------------------------------------     
Offset_0x030DA8:
                dc.w    Offset_0x030DB2-Offset_0x030DA8
                dc.w    Offset_0x030DC4-Offset_0x030DA8
                dc.w    Offset_0x030E18-Offset_0x030DA8
                dc.w    Offset_0x030DCE-Offset_0x030DA8
                dc.w    Offset_0x030E7E-Offset_0x030DA8  
;-------------------------------------------------------------------------------       
Offset_0x030DB2:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$10, Obj_Timer(A0)                              ; $002A
                move.b  #$04, Obj_Player_Status(A0)                      ; $002B
                rts  
;------------------------------------------------------------------------------- 
Offset_0x030DC4:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bmi.s   Offset_0x030DE2
                bra     Offset_0x030DD4  
;------------------------------------------------------------------------------- 
Offset_0x030DCE:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x030DE2
Offset_0x030DD4:
                lea     (Whisp_Animate_Data), A1               ; Offset_0x030E9A
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x030DE2:
                subq.b  #$01, Obj_Player_Status(A0)                      ; $002B
                bpl.s   Offset_0x030E08
                move.b  #$06, Obj_Routine(A0)                            ; $0024
                bclr    #$00, Obj_Status(A0)                             ; $0022
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                move.w  #$FE00, Obj_Speed(A0)                            ; $0010
                move.w  #$FE00, Obj_Speed_Y(A0)                          ; $0012
                bra     Offset_0x030E7E   
Offset_0x030E08:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$FF00, Obj_Speed_Y(A0)                          ; $0012
                move.b  #$60, Obj_Timer(A0)                              ; $002A    
;------------------------------------------------------------------------------- 
Offset_0x030E18:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x030E62
                bsr     Offset_0x030B18
                bclr    #$00, Obj_Status(A0)                             ; $0022
                tst.w   D0
                beq.s   Offset_0x030E32
                bset    #$00, Obj_Status(A0)                             ; $0022
Offset_0x030E32:
                move.w  Offset_0x030E5E(PC, D0), D2
                add.w   D2, Obj_Speed(A0)                                ; $0010
                move.w  Offset_0x030E5E(PC, D1), D2
                add.w   D2, Obj_Speed_Y(A0)                              ; $0012
                move.w  #$0200, D0
                move.w  D0, D1
                bsr     Offset_0x030B9E
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Whisp_Animate_Data), A1               ; Offset_0x030E9A
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608  
Offset_0x030E5E:
                dc.w    $FFF0, $0010           
Offset_0x030E62:
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$10, Obj_Timer(A0)                              ; $002A
                bsr     Offset_0x030BD8
                lea     (Whisp_Animate_Data), A1               ; Offset_0x030E9A
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608   
;------------------------------------------------------------------------------- 
Offset_0x030E7E:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Whisp_Animate_Data), A1               ; Offset_0x030E9A
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608   
;------------------------------------------------------------------------------- 
Obj_0x8C_Ptr:                                                  ; Offset_0x030E90
                dc.l    Whisp_Mappings                         ; Offset_0x030EA0
                dc.w    $A500
                dc.b    $04, $04, $0C, $0B     
;-------------------------------------------------------------------------------      
Whisp_Animate_Data:                                            ; Offset_0x030E9A
                dc.w    Offset_0x030E9C-Whisp_Animate_Data
Offset_0x030E9C:
                dc.b    $01, $00, $01, $FF  
;-------------------------------------------------------------------------------   
Whisp_Mappings:                                                ; Offset_0x030EA0
                dc.w    Offset_0x030EA4-Whisp_Mappings
                dc.w    Offset_0x030EB6-Whisp_Mappings
Offset_0x030EA4:
                dc.w    $0002
                dc.l    $F8080000, $0000FFF4
                dc.l    $00080003, $0001FFF4
Offset_0x030EB6:
                dc.w    $0002
                dc.l    $F8080006, $0003FFF4
                dc.l    $00080003, $0001FFF4                                              
;===============================================================================   
; Objeto 0x8C -> Moscas na Neo Green Hill
; <<<-
;===============================================================================