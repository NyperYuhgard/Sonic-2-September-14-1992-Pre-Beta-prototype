;===============================================================================
; Objeto 0x41 - Molas amarelas / vermelhas - diagonal / horizontal / vertical
; ->>>
;===============================================================================
; Offset_0x013BF0:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x013C20(PC, D0), D1
                jsr     Offset_0x013C20(PC, D1)
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                beq.s   Offset_0x013C08
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x013C08:
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     DeleteObject                           ; Offset_0x0120D0
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------
Offset_0x013C20:
                dc.w    Offset_0x013C2C-Offset_0x013C20
                dc.w    Offset_0x013D04-Offset_0x013C20
                dc.w    Offset_0x013DF6-Offset_0x013C20
                dc.w    Offset_0x014008-Offset_0x013C20
                dc.w    Offset_0x0140F4-Offset_0x013C20
                dc.w    Offset_0x01422A-Offset_0x013C20    
;-------------------------------------------------------------------------------
Offset_0x013C2C:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Springs_Mappings, Obj_Map(A0)  ; Offset_0x0143A8, $0004
                move.w  #$045C, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsr.w   #$03, D0
                andi.w  #$000E, D0
                move.w  Offset_0x013C62(PC, D0), D0
                jmp     Offset_0x013C62(PC, D0)  
;-------------------------------------------------------------------------------  
Offset_0x013C62:   
                dc.w    Offset_0x013CD8-Offset_0x013C62
                dc.w    Offset_0x013C6C-Offset_0x013C62
                dc.w    Offset_0x013C8C-Offset_0x013C62
                dc.w    Offset_0x013CA0-Offset_0x013C62
                dc.w    Offset_0x013CBA-Offset_0x013C62   
;-------------------------------------------------------------------------------   
Offset_0x013C6C:
                move.b  #$04, Obj_Routine(A0)                            ; $0024
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$03, Obj_Map_Id(A0)                             ; $001A
                move.w  #$0470, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$08, Obj_Width(A0)                              ; $0019
                bra.s   Offset_0x013CD8
;-------------------------------------------------------------------------------                 
Offset_0x013C8C:
                move.b  #$06, Obj_Routine(A0)                            ; $0024
                move.b  #$06, Obj_Map_Id(A0)                             ; $001A
                bset    #$01, Obj_Status(A0)                             ; $0022
                bra.s   Offset_0x013CD8
;-------------------------------------------------------------------------------                 
Offset_0x013CA0:
                move.b  #$08, Obj_Routine(A0)                            ; $0024
                move.b  #$04, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$07, Obj_Map_Id(A0)                             ; $001A
                move.w  #$043C, Obj_Art_VRAM(A0)                         ; $0002
                bra.s   Offset_0x013CD8
;-------------------------------------------------------------------------------                
Offset_0x013CBA:
                move.b  #$0A, Obj_Routine(A0)                            ; $0024
                move.b  #$04, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$0A, Obj_Map_Id(A0)                             ; $001A
                move.w  #$043C, Obj_Art_VRAM(A0)                         ; $0002
                bset    #$01, Obj_Status(A0)                             ; $0022
;-------------------------------------------------------------------------------                
Offset_0x013CD8:
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$0002, D0
                move.w  Offset_0x013D00(PC, D0), Obj_Control_Var_04(A0)  ; $0030
                btst    #$01, D0
                beq.s   Offset_0x013CFA
                bset    #$05, Obj_Art_VRAM(A0)                           ; $0002
                move.l  #Springs_Mappings_01, Obj_Map(A0) ; Offset_0x0143BE, $0004
Offset_0x013CFA:
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                rts    
;-------------------------------------------------------------------------------
Offset_0x013D00:
                dc.w    $F000, $F600
;------------------------------------------------------------------------------- 
Offset_0x013D04:
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0010, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     SolidObject_2_A1                       ; Offset_0x01486A
                btst    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x013D2C
                bsr.s   Offset_0x013D50
Offset_0x013D2C:
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$04, D6
                bsr     SolidObject_2_A1                       ; Offset_0x01486A
                btst    #$04, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x013D44
                bsr.s   Offset_0x013D50
Offset_0x013D44:
                lea     (Springs_Animate_Data), A1             ; Offset_0x01436E
                bra     AnimateSprite                          ; Offset_0x01212E
;------------------------------------------------------------------------------- 
                rts
;-------------------------------------------------------------------------------
Offset_0x013D50:
                move.w  #$0100, Obj_Ani_Number(A0)                       ; $001C
                addq.w  #$08, Obj_Y(A1)                                  ; $000C
                move.w  Obj_Control_Var_04(A0), Obj_Speed_Y(A1)   ; $0012, $0030
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$10, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$02, Obj_Routine(A1)                            ; $0024
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl.s   Offset_0x013D84
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
Offset_0x013D84:
                btst    #$00, D0
                beq.s   Offset_0x013DC4
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
                move.b  #$01, Obj_Flip_Angle(A1)                         ; $0027
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$00, Obj_Control_Var_00(A1)                     ; $002C
                move.b  #$04, Obj_Control_Var_01(A1)                     ; $002D
                btst    #$01, D0
                bne.s   Offset_0x013DB4
                move.b  #$01, Obj_Control_Var_00(A1)                     ; $002C
Offset_0x013DB4:
                btst    #$00, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x013DC4
                neg.b   Obj_Flip_Angle(A1)                               ; $0027
                neg.w   Obj_Inertia(A1)                                  ; $0014
Offset_0x013DC4:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x013DDA
                move.b  #$0C, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0D, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x013DDA:
                cmpi.b  #$08, D0
                bne.s   Offset_0x013DEC
                move.b  #$0E, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0F, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x013DEC:
                move.w  #$00CC, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912
;-------------------------------------------------------------------------------                
Offset_0x013DF6:
                move.w  #$0013, D1
                move.w  #$000E, D2
                move.w  #$000F, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     SolidObject_2_A1                       ; Offset_0x01486A
                btst    #$05, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x013E36
                move.b  Obj_Status(A0), D1                               ; $0022
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_X(A1), D0                                    ; $0008
                bcs.s   Offset_0x013E2E
                eori.b  #$01, D1
Offset_0x013E2E:
                andi.b  #$01, D1
                bne.s   Offset_0x013E36
                bsr.s   Offset_0x013E76
Offset_0x013E36:
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$04, D6
                bsr     SolidObject_2_A1                       ; Offset_0x01486A
                btst    #$06, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x013E66
                move.b  Obj_Status(A0), D1                               ; $0022
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_X(A1), D0                                    ; $0008
                bcs.s   Offset_0x013E5E
                eori.b  #$01, D1
Offset_0x013E5E:
                andi.b  #$01, D1
                bne.s   Offset_0x013E66
                bsr.s   Offset_0x013E76
Offset_0x013E66:
                bsr     Offset_0x013F4E
                lea     (Springs_Animate_Data), A1             ; Offset_0x01436E
                bra     AnimateSprite                          ; Offset_0x01212E  
;------------------------------------------------------------------------------- 
                rts
;-------------------------------------------------------------------------------
Offset_0x013E76:
                move.w  #$0300, Obj_Ani_Number(A0)                       ; $001C
                move.w  Obj_Control_Var_04(A0), Obj_Speed(A1)     ; $0010, $0030
                addq.w  #$08, Obj_X(A1)                                  ; $0008
                bset    #$00, Obj_Status(A1)                             ; $0022
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x013EA4
                bclr    #$00, Obj_Status(A1)                             ; $0022
                subi.w  #$0010, Obj_X(A1)                                ; $0008
                neg.w   Obj_Speed(A1)                                    ; $0010
Offset_0x013EA4:
                move.w  #$000F, Obj_Control_Var_02(A1)                   ; $002E
                move.w  Obj_Speed(A1), Obj_Inertia(A1)            ; $0010, $0014
                btst    #$02, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x013EBE
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
Offset_0x013EBE:
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl.s   Offset_0x013ECA
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
Offset_0x013ECA:
                btst    #$00, D0
                beq.s   Offset_0x013F0A
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
                move.b  #$01, Obj_Flip_Angle(A1)                         ; $0027
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$01, Obj_Control_Var_00(A1)                     ; $002C
                move.b  #$08, Obj_Control_Var_01(A1)                     ; $002D
                btst    #$01, D0
                bne.s   Offset_0x013EFA
                move.b  #$03, Obj_Control_Var_00(A1)                     ; $002C
Offset_0x013EFA:
                btst    #$00, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x013F0A
                neg.b   Obj_Flip_Angle(A1)                               ; $0027
                neg.w   Obj_Inertia(A1)                                  ; $0014
Offset_0x013F0A:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x013F20
                move.b  #$0C, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0D, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x013F20:
                cmpi.b  #$08, D0
                bne.s   Offset_0x013F32
                move.b  #$0E, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0F, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x013F32:
                bclr    #$05, Obj_Status(A0)                             ; $0022
                bclr    #$06, Obj_Status(A0)                             ; $0022
                bclr    #$05, Obj_Status(A1)                             ; $0022
                move.w  #$00CC, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912
Offset_0x013F4E:
                cmpi.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                beq     Offset_0x014006
                move.w  Obj_X(A0), D0                                    ; $0008
                move.w  D0, D1
                addi.w  #$0028, D1
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x013F70
                move.w  D0, D1
                subi.w  #$0028, D0
Offset_0x013F70:
                move.w  Obj_Y(A0), D2                                    ; $000C
                move.w  D2, D3
                subi.w  #$0018, D2
                addi.w  #$0018, D3
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x013FC4
                move.w  Obj_Inertia(A1), D4                              ; $0014
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x013F98
                neg.w   D4
Offset_0x013F98:
                tst.w   D4
                bmi.s   Offset_0x013FC4
                move.w  Obj_X(A1), D4                                    ; $0008
                cmp.w   D0, D4
                bcs     Offset_0x013FC4
                cmp.w   D1, D4
                bcc     Offset_0x013FC4
                move.w  Obj_Y(A1), D4                                    ; $000C
                cmp.w   D2, D4
                bcs     Offset_0x013FC4
                cmp.w   D3, D4
                bcc     Offset_0x013FC4
                move.w  D0, -(A7)
                bsr     Offset_0x013E76
                move.w  (A7)+, D0
Offset_0x013FC4:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x014006
                move.w  Obj_Inertia(A1), D4                              ; $0014
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x013FDE
                neg.w   D4
Offset_0x013FDE:
                tst.w   D4
                bmi.s   Offset_0x014006
                move.w  Obj_X(A1), D4                                    ; $0008
                cmp.w   D0, D4
                bcs     Offset_0x014006
                cmp.w   D1, D4
                bcc     Offset_0x014006
                move.w  Obj_Y(A1), D4                                    ; $000C
                cmp.w   D2, D4
                bcs     Offset_0x014006
                cmp.w   D3, D4
                bcc     Offset_0x014006
                bsr     Offset_0x013E76
Offset_0x014006:
                rts
;-------------------------------------------------------------------------------                
Offset_0x014008:
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0010, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     SolidObject_2_A1                       ; Offset_0x01486A
                cmpi.w  #$FFFE, D4
                bne.s   Offset_0x01402E
                bsr.s   Offset_0x014050
Offset_0x01402E:
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$04, D6
                bsr     SolidObject_2_A1                       ; Offset_0x01486A
                cmpi.w  #$FFFE, D4
                bne.s   Offset_0x014044
                bsr.s   Offset_0x014050
Offset_0x014044:
                lea     (Springs_Animate_Data), A1             ; Offset_0x01436E
                bra     AnimateSprite                          ; Offset_0x01212E
;------------------------------------------------------------------------------- 
                rts
;-------------------------------------------------------------------------------
Offset_0x014050:
                move.w  #$0100, Obj_Ani_Number(A0)                       ; $001C
                subq.w  #$08, Obj_Y(A1)                                  ; $000C
                move.w  Obj_Control_Var_04(A0), Obj_Speed_Y(A1)   ; $0012, $0030
                neg.w   Obj_Speed_Y(A1)                                  ; $0012
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl.s   Offset_0x014070
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
Offset_0x014070:
                btst    #$00, D0
                beq.s   Offset_0x0140B0
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
                move.b  #$01, Obj_Flip_Angle(A1)                         ; $0027
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$00, Obj_Control_Var_00(A1)                     ; $002C
                move.b  #$04, Obj_Control_Var_01(A1)                     ; $002D
                btst    #$01, D0
                bne.s   Offset_0x0140A0
                move.b  #$01, Obj_Control_Var_00(A1)                     ; $002C
Offset_0x0140A0:
                btst    #$00, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x0140B0
                neg.b   Obj_Flip_Angle(A1)                               ; $0027
                neg.w   Obj_Inertia(A1)                                  ; $0014
Offset_0x0140B0:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x0140C6
                move.b  #$0C, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0D, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x0140C6:
                cmpi.b  #$08, D0
                bne.s   Offset_0x0140D8
                move.b  #$0E, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0F, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x0140D8:
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$02, Obj_Routine(A1)                            ; $0024
                move.w  #$00CC, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912
;-------------------------------------------------------------------------------                
Offset_0x0140F4:
                move.w  #$001B, D1
                move.w  #$0010, D2
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     Offset_0x014336(PC), A2
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     SolidObject_3_A1                       ; Offset_0x0148C2
                btst    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01411C
                bsr.s   Offset_0x014140
Offset_0x01411C:
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$04, D6
                bsr     SolidObject_3_A1                       ; Offset_0x0148C2
                btst    #$04, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x014134
                bsr.s   Offset_0x014140
Offset_0x014134:
                lea     (Springs_Animate_Data), A1             ; Offset_0x01436E
                bra     AnimateSprite                          ; Offset_0x01212E
;------------------------------------------------------------------------------- 
                rts
;-------------------------------------------------------------------------------  
Offset_0x014140:
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x014156
                move.w  Obj_X(A0), D0                                    ; $0008
                subq.w  #$04, D0
                cmp.w   Obj_X(A1), D0                                    ; $0008
                bcs.s   Offset_0x014164
                rts
Offset_0x014156:
                move.w  Obj_X(A0), D0                                    ; $0008
                addq.w  #$04, D0
                cmp.w   Obj_X(A1), D0                                    ; $0008
                bcc.s   Offset_0x014164
                rts
Offset_0x014164:
                move.w  #$0500, Obj_Ani_Number(A0)                       ; $001C
                move.w  Obj_Control_Var_04(A0), Obj_Speed_Y(A1)   ; $0012, $0030
                move.w  Obj_Control_Var_04(A0), Obj_Speed(A1)     ; $0010, $0030
                addq.w  #$06, Obj_Y(A1)                                  ; $000C
                addq.w  #$06, Obj_X(A1)                                  ; $0008
                bset    #$00, Obj_Status(A1)                             ; $0022
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x01419C
                bclr    #$00, Obj_Status(A1)                             ; $0022
                subi.w  #$000C, Obj_X(A1)                                ; $0008
                neg.w   Obj_Speed(A1)                                    ; $0010
Offset_0x01419C:
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$10, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$02, Obj_Routine(A1)                            ; $0024
                move.b  Obj_Subtype(A0), D0                              ; $0028
                btst    #$00, D0
                beq.s   Offset_0x0141F8
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
                move.b  #$01, Obj_Flip_Angle(A1)                         ; $0027
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$01, Obj_Control_Var_00(A1)                     ; $002C
                move.b  #$08, Obj_Control_Var_01(A1)                     ; $002D
                btst    #$01, D0
                bne.s   Offset_0x0141E8
                move.b  #$03, Obj_Control_Var_00(A1)                     ; $002C
Offset_0x0141E8:
                btst    #$00, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x0141F8
                neg.b   Obj_Flip_Angle(A1)                               ; $0027
                neg.w   Obj_Inertia(A1)                                  ; $0014
Offset_0x0141F8:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x01420E
                move.b  #$0C, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0D, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x01420E:
                cmpi.b  #$08, D0
                bne.s   Offset_0x014220
                move.b  #$0E, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0F, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x014220:
                move.w  #$00CC, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912
;-------------------------------------------------------------------------------                
Offset_0x01422A:
                move.w  #$001B, D1
                move.w  #$0010, D2
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     Offset_0x014352(PC), A2
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     SolidObject_3_A1                       ; Offset_0x0148C2
                cmpi.w  #$FFFE, D4
                bne.s   Offset_0x014250
                bsr.s   Offset_0x014272
Offset_0x014250:
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$04, D6
                bsr     SolidObject_3_A1                       ; Offset_0x0148C2
                cmpi.w  #$FFFE, D4
                bne.s   Offset_0x014266
                bsr.s   Offset_0x014272
Offset_0x014266:
                lea     (Springs_Animate_Data), A1             ; Offset_0x01436E
                bra     AnimateSprite                          ; Offset_0x01212E 
;------------------------------------------------------------------------------- 
                rts
;------------------------------------------------------------------------------- 
Offset_0x014272:
                move.w  #$0500, Obj_Ani_Number(A0)                       ; $001C
                move.w  Obj_Control_Var_04(A0), Obj_Speed_Y(A1)   ; $0012, $0030
                neg.w   Obj_Speed_Y(A1)                                  ; $0012
                move.w  Obj_Control_Var_04(A0), Obj_Speed(A1)     ; $0010, $0030
                subq.w  #$06, Obj_Y(A1)                                  ; $000C
                addq.w  #$06, Obj_X(A1)                                  ; $0008
                bset    #$00, Obj_Status(A1)                             ; $0022
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x0142AE
                bclr    #$00, Obj_Status(A1)                             ; $0022
                subi.w  #$000C, Obj_X(A1)                                ; $0008
                neg.w   Obj_Speed(A1)                                    ; $0010
Offset_0x0142AE:
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$02, Obj_Routine(A1)                            ; $0024
                move.b  Obj_Subtype(A0), D0                              ; $0028
                btst    #$00, D0
                beq.s   Offset_0x014304
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
                move.b  #$01, Obj_Flip_Angle(A1)                         ; $0027
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$01, Obj_Control_Var_00(A1)                     ; $002C
                move.b  #$08, Obj_Control_Var_01(A1)                     ; $002D
                btst    #$01, D0
                bne.s   Offset_0x0142F4
                move.b  #$03, Obj_Control_Var_00(A1)                     ; $002C
Offset_0x0142F4:
                btst    #$00, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x014304
                neg.b   Obj_Flip_Angle(A1)                               ; $0027
                neg.w   Obj_Inertia(A1)                                  ; $0014
Offset_0x014304:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x01431A
                move.b  #$0C, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0D, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x01431A:
                cmpi.b  #$08, D0
                bne.s   Offset_0x01432C
                move.b  #$0E, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0F, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x01432C:
                move.w  #$00CC, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912   
;-------------------------------------------------------------------------------
Offset_0x014336:
                dc.b    $10, $10, $10, $10, $10, $10, $10, $10
                dc.b    $10, $10, $10, $10, $0E, $0C, $0A, $08
                dc.b    $06, $04, $02, $00, $FE, $FC, $FC, $FC
                dc.b    $FC, $FC, $FC, $FC           
;-------------------------------------------------------------------------------  
Offset_0x014352:
                dc.b    $F4, $F0, $F0, $F0, $F0, $F0, $F0, $F0
                dc.b    $F0, $F0, $F0, $F0, $F2, $F4, $F6, $F8
                dc.b    $FA, $FC, $FE, $00, $02, $04, $04, $04
                dc.b    $04, $04, $04, $04                 
;-------------------------------------------------------------------------------
Springs_Animate_Data:                                          ; Offset_0x01436E
                dc.w    Offset_0x01437A-Springs_Animate_Data
                dc.w    Offset_0x01437D-Springs_Animate_Data
                dc.w    Offset_0x014389-Springs_Animate_Data
                dc.w    Offset_0x01438C-Springs_Animate_Data
                dc.w    Offset_0x014398-Springs_Animate_Data
                dc.w    Offset_0x01439B-Springs_Animate_Data
Offset_0x01437A:
                dc.b    $0F, $00, $FF
Offset_0x01437D:
                dc.b    $00, $01, $00, $00, $02, $02, $02, $02, $02, $02, $FD, $00
Offset_0x014389:
                dc.b    $0F, $03, $FF
Offset_0x01438C:
                dc.b    $00, $04, $03, $03, $05, $05, $05, $05, $05, $05, $FD, $02
Offset_0x014398:
                dc.b    $0F, $07, $FF
Offset_0x01439B:
                dc.b    $00, $08, $07, $07, $09, $09, $09, $09, $09, $09, $FD, $04, $00
;-------------------------------------------------------------------------------
Springs_Mappings:                                              ; Offset_0x0143A8
                dc.w    Offset_0x0143D4-Springs_Mappings
                dc.w    Offset_0x0143E6-Springs_Mappings
                dc.w    Offset_0x0143F0-Springs_Mappings
                dc.w    Offset_0x014402-Springs_Mappings
                dc.w    Offset_0x014414-Springs_Mappings
                dc.w    Offset_0x01441E-Springs_Mappings
                dc.w    Offset_0x014430-Springs_Mappings
                dc.w    Offset_0x014442-Springs_Mappings
                dc.w    Offset_0x014464-Springs_Mappings
                dc.w    Offset_0x01447E-Springs_Mappings
                dc.w    Offset_0x0144A0-Springs_Mappings
;-------------------------------------------------------------------------------                
Springs_Mappings_01:  
                dc.w    Offset_0x0143D4-Springs_Mappings_01
                dc.w    Offset_0x0143E6-Springs_Mappings_01
                dc.w    Offset_0x0143F0-Springs_Mappings_01
                dc.w    Offset_0x014402-Springs_Mappings_01
                dc.w    Offset_0x014414-Springs_Mappings_01
                dc.w    Offset_0x01441E-Springs_Mappings_01
                dc.w    Offset_0x014430-Springs_Mappings_01
                dc.w    Offset_0x0144C2-Springs_Mappings_01
                dc.w    Offset_0x0144E4-Springs_Mappings_01
                dc.w    Offset_0x0144FE-Springs_Mappings_01
                dc.w    Offset_0x014520-Springs_Mappings_01                
Offset_0x0143D4:
                dc.w    $0002
                dc.l    $F00D0000, $0000FFF0, $00050008, $0004FFF8
Offset_0x0143E6:
                dc.w    $0001
                dc.l    $F80D0000, $0000FFF0
Offset_0x0143F0:
                dc.w    $0002
                dc.l    $E00D0000, $0000FFF0, $F007000C, $0006FFF8
Offset_0x014402:
                dc.w    $0002
                dc.l    $F0030000, $00000000, $F8010004, $0002FFF8
Offset_0x014414:
                dc.w    $0001
                dc.l    $F0030000, $0000FFF8
Offset_0x01441E:
                dc.w    $0002
                dc.l    $F0030000, $00000010, $F8090006, $0003FFF8
Offset_0x014430:
                dc.w    $0002
                dc.l    $000D1000, $1000FFF0, $F0051008, $1004FFF8
Offset_0x014442:
                dc.w    $0004
                dc.l    $F00D0000, $0000FFF0, $00050008, $00040000
                dc.l    $FB05000C, $0006FFF6, $0005201C, $200EFFF0
Offset_0x014464:
                dc.w    $0003
                dc.l    $F60D0000, $0000FFEA, $06050008, $0004FFFA
                dc.l    $0005201C, $200EFFF0
Offset_0x01447E:
                dc.w    $0004
                dc.l    $E60D0000, $0000FFFB, $F6050008, $0004000B
                dc.l    $F30B0010, $0008FFF6, $0005201C, $200EFFF0
Offset_0x0144A0:
                dc.w    $0004
                dc.l    $000D1000, $1000FFF0, $F0051008, $10040000
                dc.l    $F505100C, $1006FFF6, $F005301C, $300EFFF0  
;-------------------------------------------------------------------------------
Offset_0x0144C2:
                dc.w    $0004
                dc.l    $F00D0000, $0000FFF0, $00050008, $00040000
                dc.l    $FB05000C, $0006FFF6, $0005001C, $000EFFF0
Offset_0x0144E4:
                dc.w    $0003
                dc.l    $F60D0000, $0000FFEA, $06050008, $0004FFFA
                dc.l    $0005001C, $000EFFF0
Offset_0x0144FE:
                dc.w    $0004
                dc.l    $E60D0000, $0000FFFB, $F6050008, $0004000B
                dc.l    $F30B0010, $0008FFF6, $0005001C, $000EFFF0
Offset_0x014520:
                dc.w    $0004
                dc.l    $000D1000, $1000FFF0, $F0051008, $10040000
                dc.l    $F505100C, $1006FFF6, $F005101C, $100EFFF0                                                                                                                   
;===============================================================================
; Objeto 0x41 - Molas amarelas / vermelhas - diagonal / horizontal / vertical
; <<<-
;===============================================================================