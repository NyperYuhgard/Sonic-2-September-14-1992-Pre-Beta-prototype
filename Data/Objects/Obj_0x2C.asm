;===============================================================================
; Objeto 0x2C - Folhas soltas na Neo Green Hill
; ->>>          
;===============================================================================  
; Offset_0x020B08:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x020B16(PC, D0), D1
                jmp     Offset_0x020B16(PC, D1)       
;-------------------------------------------------------------------------------  
Offset_0x020B16:
                dc.w    Offset_0x020B20-Offset_0x020B16
                dc.w    Offset_0x020B56-Offset_0x020B16
                dc.w    Offset_0x020CA4-Offset_0x020B16
;-------------------------------------------------------------------------------    
Offset_0x020B1C:
                dc.b    $D6, $D4, $D5, $00                      
;-------------------------------------------------------------------------------   
Offset_0x020B20:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                move.b  Offset_0x020B1C(PC, D0), Obj_Col_Flags(A0)       ; $0020
                move.l  #Lava_Attributes_Mappings, Obj_Map(A0) ; Offset_0x01B900, $0004
                move.w  #$8680, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$84, Obj_Flags(A0)                              ; $0001
                move.b  #$80, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  Obj_Subtype(A0), Obj_Map_Id(A0)           ; $001A, $0028  
;-------------------------------------------------------------------------------  
Offset_0x020B56:
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Jmp_0E_To_DeleteObject                 ; Offset_0x020D62
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                beq.s   Offset_0x020B74
                bsr     Jmp_0A_To_DisplaySprite                ; Offset_0x020D5C
Offset_0x020B74:
                move.b  Obj_Col_Prop(A0), D0                             ; $0021
                beq.s   Offset_0x020BD0
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                beq.s   Offset_0x020B8A
                add.b   ($FFFFFE05).w, D0
                andi.w  #$000F, D0
                bne.s   Offset_0x020BA6
Offset_0x020B8A:
                lea     (Obj_Memory_Address).w, A2                   ; $FFFFB000
                bclr    #$00, Obj_Col_Prop(A0)                           ; $0021
                beq.s   Offset_0x020BCA
                bsr.s   Offset_0x020BD6
                tst.w   Obj_Control_Var_02(A0)                           ; $002E
                bne.s   Offset_0x020BCA
                move.w  ($FFFFFE04).w, Obj_Control_Var_02(A0)            ; $002E
                bra.s   Offset_0x020BCA
Offset_0x020BA6:
                addi.w  #$0008, D0
                andi.w  #$000F, D0
                bne.s   Offset_0x020BCA
                lea     (Obj_Memory_Address+$0040).w, A2             ; $FFFFB040
                bclr    #$01, Obj_Col_Prop(A0)                           ; $0021
                beq.s   Offset_0x020BCA
                bsr.s   Offset_0x020BD6
                tst.w   Obj_Control_Var_02(A0)                           ; $002E
                bne.s   Offset_0x020BCA
                move.w  ($FFFFFE04).w, Obj_Control_Var_02(A0)            ; $002E
Offset_0x020BCA:
                clr.b   Obj_Col_Prop(A0)                                 ; $0021
                rts
Offset_0x020BD0:
                clr.w   Obj_Control_Var_02(A0)                           ; $002E
                rts
Offset_0x020BD6:
                move.w  Obj_Speed(A2), D0                                ; $0010
                bpl.s   Offset_0x020BDE
                neg.w   D0
Offset_0x020BDE:
                cmpi.w  #$0200, D0
                bcc.s   Offset_0x020BF2
                move.w  Obj_Speed_Y(A2), D0                              ; $0012
                bpl.s   Offset_0x020BEC
                neg.w   D0
Offset_0x020BEC:
                cmpi.w  #$0200, D0
                bcs.s   Offset_0x020BD0
Offset_0x020BF2:
                lea     (Offset_0x020C94), A3
                moveq   #$03, D6
Offset_0x020BFA:
                bsr     Jmp_03_To_SingleObjectLoad             ; Offset_0x020D68
                bne     Offset_0x020C86
                move.b  #$2C, Obj_Id(A1)                                 ; $0000
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A2), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A2), Obj_Y(A1)                      ; $000C, $000C
                bsr     Jmp_01_To_PseudoRandomNumber           ; Offset_0x020D6E
                andi.w  #$000F, D0
                subq.w  #$08, D0
                add.w   D0, Obj_X(A1)                                    ; $0008
                swap.w  D0
                andi.w  #$000F, D0
                subq.w  #$08, D0
                add.w   D0, Obj_Y(A1)                                    ; $000C
                move.w  (A3)+, Obj_Speed(A1)                             ; $0010
                move.w  (A3)+, Obj_Speed_Y(A1)                           ; $0012
                btst    #$00, Obj_Status(A2)                             ; $0022
                beq.s   Offset_0x020C48
                neg.w   Obj_Speed(A1)                                    ; $0010
Offset_0x020C48:
                move.w  Obj_X(A1), Obj_Control_Var_04(A1)         ; $0008, $0030
                move.w  Obj_Y(A1), Obj_Control_Var_08(A1)         ; $000C, $0034
                andi.b  #$01, D0
                move.b  D0, Obj_Map_Id(A1)                               ; $001A
                move.l  #Leaves_Mappings, Obj_Map(A1)   ; Offset_0x020D2C, $0004
                move.w  #$E410, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$84, Obj_Flags(A1)                              ; $0001
                move.b  #$08, Obj_Width(A1)                              ; $0019
                move.b  #$01, Obj_Priority(A1)                           ; $0018
                move.b  #$04, Obj_Control_Var_0C(A1)                     ; $0038
                move.b  D1, Obj_Angle(A0)                                ; $0026
Offset_0x020C86:
                dbra    D6, Offset_0x020BFA
                move.w  #$00E5, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912      
;-------------------------------------------------------------------------------  
Offset_0x020C94:
                dc.w    $FF80, $FF80, $00C0, $FFC0, $FF40, $0040, $0080, $0080    
;-------------------------------------------------------------------------------   
Offset_0x020CA4:
                move.b  Obj_Control_Var_0C(A0), D0                       ; $0038
                add.b   D0, Obj_Angle(A0)                                ; $0026
                add.b   ($FFFFFE0F).w, D0
                andi.w  #$001F, D0
                bne.s   Offset_0x020CC2
                add.b   D7, D0
                andi.b  #$01, D0
                beq.s   Offset_0x020CC2
                neg.b   Obj_Control_Var_0C(A0)                           ; $0038
Offset_0x020CC2:
                move.l  Obj_Control_Var_04(A0), D2                       ; $0030
                move.l  Obj_Control_Var_08(A0), D3                       ; $0034
                move.w  Obj_Speed(A0), D0                                ; $0010
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  Obj_Speed_Y(A0), D0                              ; $0012
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D2, Obj_Control_Var_04(A0)                       ; $0030
                move.l  D3, Obj_Control_Var_08(A0)                       ; $0034
                swap.w  D2
                andi.w  #$0003, D3
                addq.w  #$04, D3
                add.w   D3, Obj_Speed_Y(A0)                              ; $0012
                move.b  Obj_Angle(A0), D0                                ; $0026
                bsr     Jmp_06_To_CalcSine                     ; Offset_0x020D74
                asr.w   #$06, D0
                add.w   Obj_Control_Var_04(A0), D0                       ; $0030
                move.w  D0, Obj_X(A0)                                    ; $0008
                asr.w   #$06, D1
                add.w   Obj_Control_Var_08(A0), D1                       ; $0034
                move.w  D1, Obj_Y(A0)                                    ; $000C
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x020D20
                move.b  #$0B, Obj_Ani_Time(A0)                           ; $001E
                bchg    #01, Obj_Map_Id(A0)                              ; $001A
Offset_0x020D20:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     Jmp_0E_To_DeleteObject                 ; Offset_0x020D62
                bra     Jmp_0A_To_DisplaySprite                ; Offset_0x020D5C              
;-------------------------------------------------------------------------------
Leaves_Mappings:                                               ; Offset_0x020D2C
                dc.w    Offset_0x020D34-Leaves_Mappings
                dc.w    Offset_0x020D3E-Leaves_Mappings
                dc.w    Offset_0x020D48-Leaves_Mappings
                dc.w    Offset_0x020D52-Leaves_Mappings
Offset_0x020D34:
                dc.w    $0001
                dc.l    $FC000000, $0000FFFC
Offset_0x020D3E:
                dc.w    $0001
                dc.l    $FC040001, $0000FFF8
Offset_0x020D48:
                dc.w    $0001
                dc.l    $FC040003, $0001FFF8
Offset_0x020D52:
                dc.w    $0001
                dc.l    $FC040005, $0002FFF8                                                                       
;===============================================================================   
; Objeto 0x2C - Folhas soltas na Neo Green Hill
; <<<-
;===============================================================================
