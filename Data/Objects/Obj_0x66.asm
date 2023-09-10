;===============================================================================
; Objeto 0x66 - Objeto para as molas triangulares nas paredes da Metropolis
; ->>> 
;=============================================================================== 
; Offset_0x021954:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x021962(PC, D0), D1
                jmp     Offset_0x021962(PC, D1)         
;-------------------------------------------------------------------------------
Offset_0x021962:
                dc.w    Offset_0x021966-Offset_0x021962
                dc.w    Offset_0x0219AA-Offset_0x021962
;-------------------------------------------------------------------------------  
Offset_0x021966:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Springs_Wall_Mappings, Obj_Map(A0) ; Offset_0x021B1C, $0004
                move.w  #$8680, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_16_To_ModifySpriteAttr_2P          ; Offset_0x021B50
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$40, Obj_Height_2(A0)                           ; $0016
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsr.b   #$04, D0
                andi.b  #$07, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                beq.s   Offset_0x0219AA
                move.b  #$80, Obj_Height_2(A0)                           ; $0016
;-------------------------------------------------------------------------------                 
Offset_0x0219AA:
                move.w  #$0013, D1
                moveq   #$00, D2
                move.b  Obj_Height_2(A0), D2                             ; $0016
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     Jmp_02_To_SolidObject_2_A1             ; Offset_0x021B56
                cmpi.b  #$01, D4
                bne.s   Offset_0x0219F2
                btst    #$01, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x0219F2
                move.b  Obj_Status(A0), D1                               ; $0022
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_X(A1), D0                                    ; $0008
                bcs.s   Offset_0x0219EA
                eori.b  #$01, D1
Offset_0x0219EA:
                andi.b  #$01, D1
                bne.s   Offset_0x0219F2
                bsr.s   Offset_0x021A48
Offset_0x0219F2:
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$04, D6
                bsr     Jmp_02_To_SolidObject_2_A1             ; Offset_0x021B56
                cmpi.b  #$01, D4
                bne.s   Offset_0x021A28
                btst    #$01, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x021A28
                move.b  Obj_Status(A0), D1                               ; $0022
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_X(A1), D0                                    ; $0008
                bcs.s   Offset_0x021A20
                eori.b  #$01, D1
Offset_0x021A20:
                andi.b  #$01, D1
                bne.s   Offset_0x021A28
                bsr.s   Offset_0x021A48
Offset_0x021A28:
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Jmp_10_To_DeleteObject                 ; Offset_0x021B4A
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                beq.s   Offset_0x021A46
                bsr     Jmp_0C_To_DisplaySprite                ; Offset_0x021B44
Offset_0x021A46:
                rts
Offset_0x021A48:
                move.w  Obj_Control_Var_04(A0), Obj_Speed(A1)     ; $0010, $0030
                move.w  #$F800, Obj_Speed(A1)                            ; $0010
                move.w  #$F800, Obj_Speed_Y(A1)                          ; $0012
                bset    #$00, Obj_Status(A1)                             ; $0022
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x021A72
                bclr    #$00, Obj_Status(A1)                             ; $0022
                neg.w   Obj_Speed(A1)                                    ; $0010
Offset_0x021A72:
                move.w  #$000F, Obj_Player_Control(A1)                   ; $002E
                move.w  Obj_Speed(A1), Obj_Inertia(A1)            ; $0010, $0014
                btst    #$02, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x021A8C
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
Offset_0x021A8C:
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl.s   Offset_0x021A98
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
Offset_0x021A98:
                btst    #$00, D0
                beq.s   Offset_0x021AD8
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
                move.b  #$01, Obj_Flip_Angle(A1)                         ; $0027
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$01, Obj_P_Flips_Remaining(A1)                  ; $002C
                move.b  #$08, Obj_Player_Flip_Speed(A1)                  ; $002D
                btst    #$01, D0
                bne.s   Offset_0x021AC8
                move.b  #$03, Obj_P_Flips_Remaining(A1)                  ; $002C
Offset_0x021AC8:
                btst    #$00, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x021AD8
                neg.b   Obj_Flip_Angle(A1)                               ; $0027
                neg.w   Obj_Inertia(A1)                                  ; $0014
Offset_0x021AD8:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x021AEE
                move.b  #$0C, Obj_Player_Top_Solid(A1)                   ; $003E
                move.b  #$0D, Obj_Player_LRB_Solid(A1)                   ; $003F
Offset_0x021AEE:
                cmpi.b  #$08, D0
                bne.s   Offset_0x021B00
                move.b  #$0E, Obj_Player_Top_Solid(A1)                   ; $003E
                move.b  #$0F, Obj_Player_LRB_Solid(A1)                   ; $003F
Offset_0x021B00:
                bclr    #$05, Obj_Status(A0)                             ; $0022
                bclr    #$06, Obj_Status(A0)                             ; $0022
                bclr    #$05, Obj_Status(A1)                             ; $0022
                move.w  #$00CC, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912   
;-------------------------------------------------------------------------------
Springs_Wall_Mappings:                                         ; Offset_0x021B1C
                dc.w    Offset_0x021B20-Springs_Wall_Mappings
                dc.w    Offset_0x021B32-Springs_Wall_Mappings
Offset_0x021B20:
                dc.w    $0002
                dc.l    $C0050034, $001AFFF8
                dc.l    $30050034, $001AFFF8
Offset_0x021B32:
                dc.w    $0002
                dc.l    $80050034, $001AFFF8
                dc.l    $70050034, $001AFFF8                                                                                                    
;===============================================================================
; Objeto 0x66 - Objeto para as molas triangulares nas paredes da Metropolis
; <<<- 
;===============================================================================