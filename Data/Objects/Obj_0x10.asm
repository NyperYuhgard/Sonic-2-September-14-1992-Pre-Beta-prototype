;===============================================================================
; Objeto 0x10 - Miles no Special Stage
; ->>>
;===============================================================================
Offset_0x02FC1C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x02FC2A(PC, D0), D1
                jmp     Offset_0x02FC2A(PC, D1)
;-------------------------------------------------------------------------------   
Offset_0x02FC2A:
                dc.w    Offset_0x02FC30-Offset_0x02FC2A
                dc.w    Offset_0x02FD18-Offset_0x02FC2A
                dc.w    Offset_0x02FDB6-Offset_0x02FC2A  
;-------------------------------------------------------------------------------   
Offset_0x02FC30:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$007F, Obj_X(A0)                                ; $0008
                move.w  #$00B8, Obj_Y(A0)                                ; $000C
                move.b  #$0E, Obj_Height_2(A0)                           ; $0016
                move.b  #$07, Obj_Width_2(A0)                            ; $0017
                move.l  #Miles_In_SS_Mappings, Obj_Map(A0) ; Offset_0x02FEA4, $0004
                move.w  #$4381, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.w  #$0400, Obj_Control_Var_04(A0)                   ; $0030
                move.b  #$40, Obj_Angle(A0)                              ; $0026
                move.w  Obj_X(A0), Obj_Control_Var_00(A0)         ; $0008, $002C
                move.w  Obj_Y(A0), Obj_Control_Var_02(A0)         ; $000C, $002E
                subi.w  #$0080, Obj_Control_Var_02(A0)                   ; $002E
                move.b  #$01, ($FFFFF7DE).w
                move.w  #$0066, Obj_Control_Var_0C(A0)                   ; $0038
                move.w  #$0080, Obj_Control_Var_0E(A0)                   ; $003A
                move.l  #(Obj_Memory_Address+$0300), A1              ; $FFFFB300
                move.b  #$63, (A1) ; Carrega o objeto 0x63 - Sombra do Miles
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$0018, Obj_Y(A1)                                ; $000C
                move.l  #SS_Objects_Shadow_Mappings, Obj_Map(A1) ; Offset_0x02F7E6, $0004
                move.w  #$6279, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.w  Obj_Control_Var_00(A0), Obj_Control_Var_00(A1); $002C, $002C
                move.w  Obj_Control_Var_02(A0), Obj_Control_Var_02(A1); $002E, $002E
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #(Obj_Memory_Address+$0340), A1              ; $FFFFB340
                move.b  #$88, (A1) ; Carrega o objeto 0x88 - Rabo do Miles
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.l  #Miles_Tail_In_SS_Mappings, Obj_Map(A1) ; Offset_0x03010E, $0004
                move.w  #$4375, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  Obj_Priority(A0), Obj_Priority(A1)        ; $0018, $0018
                subi.b  #$01, Obj_Priority(A1)                           ; $0018
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                rts
;-------------------------------------------------------------------------------                 
Offset_0x02FD18:
                tst.b   Obj_Routine_2(A0)                                ; $0025
                bne.s   Offset_0x02FD52
                bsr     Offset_0x02FD5C
                lea     ($FFFFF606).w, A2
                bsr     Offset_0x02F274
                bsr     Offset_0x02F2CA
                bsr     Offset_0x02F3F0
                lea     ($FFFFF607).w, A2
                bsr     Miles_In_SS_Sub                        ; Offset_0x02EF4E
                bsr     Offset_0x02F194
                lea     (Miles_In_SS_AnimateData), A1          ; Offset_0x02FE82
                bsr     SS_Animate_Sprite                      ; Offset_0x02F1E4
                bsr     Jmp_24_To_DisplaySprite                ; Offset_0x03020C
                bsr     Offset_0x02F0E4
                bra.s   SS_Load_Miles_Dynamic_PLC              ; Offset_0x02FDA4
Offset_0x02FD52:
                bsr     Offset_0x02EE4C
                bsr     Jmp_24_To_DisplaySprite                ; Offset_0x03020C
                bra.s   SS_Load_Miles_Dynamic_PLC              ; Offset_0x02FDA4
Offset_0x02FD5C:
                move.b  ($FFFFF606).w, D0
                andi.b  #$7F, D0
                beq.s   Offset_0x02FD7E
                moveq   #$00, D0
                moveq   #$03, D1
                lea     ($FFFF9B62).w, A1
Offset_0x02FD6E:
                move.l  D0, (A1)
                move.l  D0, (A1)
                dbra    D1, Offset_0x02FD6E
                move.w  #$00B4, ($FFFFF702).w
                rts
Offset_0x02FD7E:
                tst.w   ($FFFFF702).w
                beq.s   Offset_0x02FD8A
                subq.w  #$01, ($FFFFF702).w
                rts
Offset_0x02FD8A:
                lea     ($FFFF9B80).w, A1
                move.w  (A1), ($FFFFF606).w
                rts     
;-------------------------------------------------------------------------------      
Art_SS_Miles_Ram_Buffer:                                       ; Offset_0x02FD94
                dc.l    $00FF3BA0, $00FF4340, $00FF57C0, $00FF5F00              
;-------------------------------------------------------------------------------     
SS_Load_Miles_Dynamic_PLC:                                     ; Offset_0x02FDA4
                lea     Art_SS_Miles_Ram_Buffer(PC), A3        ; Offset_0x02FD94
                lea     ($FFFFF7DE).w, A4
                move.w  #$7020, D4
                moveq   #$32, D1
                bra     SS_Load_Miles_Dynamic_PLC_2            ; Offset_0x02EEE2
Offset_0x02FDB6:
                jsr     (ObjectFall)                           ; Offset_0x011F6A
                move.w  #$004D, D5
                move.l  #$00000100, D3
                bsr     Offset_0x02F02E
                bsr     Offset_0x02EFC4
                lea     (Miles_In_SS_AnimateData), A1          ; Offset_0x02FE82
                bsr     SS_Animate_Sprite                      ; Offset_0x02F1E4
                bsr     Jmp_24_To_DisplaySprite                ; Offset_0x03020C
                bra.s   SS_Load_Miles_Dynamic_PLC              ; Offset_0x02FDA4                                                                           
;===============================================================================
; Objeto 0x10 - Miles no Special Stage
; <<<-
;===============================================================================