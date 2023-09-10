;===============================================================================
; Objeto 0x9A - Inimigo tartaruga na Sky Chase (Atira bolas de fogo no jogador)
; ->>>        
;===============================================================================     
; Offset_0x031D84:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x031D92(PC, D0), D1
                jmp     Offset_0x031D92(PC, D1)                               
Offset_0x031D92:
                dc.w    Offset_0x031D96-Offset_0x031D92
                dc.w    Offset_0x031DB2-Offset_0x031D92      
Offset_0x031D96:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.w  #$FF80, Obj_Speed(A0)                            ; $0010
                bsr     Load_Turtloid_Sub_Obj_0x9B             ; Offset_0x031E98
                lea     (Turtloid_Animate_Data), A1            ; Offset_0x031FA4
                move.l  A1, Obj_Control_Var_02(A0)                       ; $002E
                bra     Load_Enemy_Boost_Sub_Obj_0x9C          ; Offset_0x031F0C
Offset_0x031DB2:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x031DC8(PC, D0), D1
                jsr     Offset_0x031DC8(PC, D1)
                bsr     Offset_0x031DD0
                bra     Offset_0x030C32      
Offset_0x031DC8:
                dc.w    Offset_0x031DEE-Offset_0x031DC8
                dc.w    Offset_0x031E18-Offset_0x031DC8
                dc.w    Offset_0x031E38-Offset_0x031DC8
                dc.w    Offset_0x031E52-Offset_0x031DC8               
Offset_0x031DD0:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bsr     Offset_0x030C20
                move.w  #$0023, D1
                move.w  #$0008, D2
                move.w  #$000E, D3
                move.w  (A7)+, D4
                bra     Jmp_04_To_Platform_Object              ; Offset_0x037644
Offset_0x031DEE:
                bsr     Offset_0x030B18
                tst.w   D0
                bmi     Return_to_sub_routine                  ; Offset_0x031E96
                cmpi.w  #$0080, D2
                bcc     Return_to_sub_routine                  ; Offset_0x031E96
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.b  #$04, Obj_Timer(A0)                              ; $002A
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                rts
Offset_0x031E18:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bpl     Return_to_sub_routine                  ; Offset_0x031E96
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$08, Obj_Timer(A0)                              ; $002A
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                move.b  #$03, Obj_Map_Id(A1)                             ; $001A
                bra     Load_Turtloid_Weapon                   ; Offset_0x031F40
Offset_0x031E38:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bpl.s   Offset_0x031E50
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$FF80, Obj_Speed(A0)                            ; $0010
                clr.b   Obj_Map_Id(A0)                                   ; $001A
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
Offset_0x031E50:
                rts
Offset_0x031E52:
                rts
;===============================================================================   
; Objeto 0x9A - Inimigo tartaruga na Sky Chase (Atira bolas de fogo no jogador)
; <<<-        
;===============================================================================