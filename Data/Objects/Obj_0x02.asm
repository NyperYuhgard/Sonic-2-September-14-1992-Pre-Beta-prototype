;===============================================================================
; Objeto 0x02 - Miles
; ->>> 
;=============================================================================== 
; Offset_0x016710:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Miles_Index(PC, D0), D1                ; Offset_0x01671E
                jmp     Miles_Index(PC, D1)                    ; Offset_0x01671E
;-------------------------------------------------------------------------------                
Miles_Index:                                                   ; Offset_0x01671E                           
                dc.w    Miles_Main-Miles_Index                 ; Offset_0x016728
                dc.w    Miles_Control-Miles_Index              ; Offset_0x016796
                dc.w    Miles_Hurt-Miles_Index                 ; Offset_0x017856
                dc.w    Miles_Death-Miles_Index                ; Offset_0x0178CE
                dc.w    Miles_ResetLevel-Miles_Index           ; Offset_0x01790E
;-------------------------------------------------------------------------------                                           
Miles_Main:                                                    ; Offset_0x016728
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$0F, Obj_Height_2(A0)                           ; $0016
                move.b  #$09, Obj_Width_2(A0)                            ; $0017
                move.l  #Miles_Mappings, Obj_Map(A0)    ; Offset_0x0739E2, $0004
                move.w  #$07A0, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$02, Obj_Priority(A0)                           ; $0018
                move.b  #$18, Obj_Width(A0)                              ; $0019
                move.b  #$84, Obj_Flags(A0)                              ; $0001
                move.w  #$0600, (Miles_Max_Speed).w                  ; $FFFFFEC0
                move.w  #$000C, (Miles_Acceleration).w               ; $FFFFFEC2
                move.w  #$0080, (Miles_Deceleration).w               ; $FFFFFEC4
                move.b  #$0C, Obj_Player_Top_Solid(A0)                   ; $003E
                move.b  #$0D, Obj_Player_LRB_Solid(A0)                   ; $003F
                move.b  #$00, Obj_P_Flips_Remaining(A0)                  ; $002C
                move.b  #$04, Obj_Player_Flip_Speed(A0)                  ; $002D
                move.b  #$1E, Obj_Subtype(A0)                            ; $0028
                move.b  #$05, ($FFFFB1C0).w
                move.w  A0, ($FFFFB1FE).w
;-------------------------------------------------------------------------------                
Miles_Control:                                                 ; Offset_0x016796
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                bne.s   Offset_0x0167A0
                bsr     Miles_CPU_Control                      ; Offset_0x01688A
Offset_0x0167A0:
                btst    #$00, Obj_Timer(A0)                              ; $002A
                bne.s   Miles_ControlsLock                     ; Offset_0x0167BA
                moveq   #$00, D0
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.w  #$0006, D0
                move.w  Miles_Modes(PC, D0), D1                ; Offset_0x016804
                jsr     Miles_Modes(PC, D1)                    ; Offset_0x016804
Miles_ControlsLock:                                            ; Offset_0x0167BA
                cmpi.w  #$FF00, (Camera_Min_Y).w                     ; $FFFFEECC
                bne.s   Offset_0x0167C8
                andi.w  #$07FF, Obj_Y(A0)                                ; $000C
Offset_0x0167C8:
                bsr.s   Miles_Display                          ; Offset_0x01680C
                bsr     Miles_RecordMoves                      ; Offset_0x016C7C
                bsr     Miles_Water                            ; Offset_0x016C96
                move.b  ($FFFFF768).w, Obj_Player_Next_Tilt(A0)          ; $0036
                move.b  ($FFFFF76A).w, Obj_Player_Tilt(A0)               ; $0037
                tst.b   ($FFFFF7C7).w
                beq.s   Offset_0x0167F0
                tst.b   Obj_Ani_Number(A0)                               ; $001C
                bne.s   Offset_0x0167F0
                move.b  Obj_Ani_Flag(A0), Obj_Ani_Number(A0)      ; $001C, $001D
Offset_0x0167F0:
                bsr     Miles_Animate                          ; Offset_0x017922
                tst.b   Obj_Timer(A0)                                    ; $002A
                bmi.s   Offset_0x016800
                jsr     (TouchResponse)                        ; Offset_0x03807C
Offset_0x016800:
                bra     Load_Miles_Dynamic_PLC                 ; Offset_0x017D0A
;-------------------------------------------------------------------------------
Miles_Modes:                                                   ; Offset_0x016804
                dc.w    Miles_MdNormal-Miles_Modes             ; Offset_0x016D4E
                dc.w    Miles_MdJump-Miles_Modes               ; Offset_0x016D76   
                dc.w    Miles_MdRoll-Miles_Modes               ; Offset_0x016DA0
                dc.w    Miles_MdJump2-Miles_Modes              ; Offset_0x016DC6
;-------------------------------------------------------------------------------
Miles_Display:                                                 ; Offset_0x01680C
                move.w  Obj_P_Invunerblt_Time(A0), D0                    ; $0030
                beq.s   Offset_0x01681A
                subq.w  #$01, Obj_P_Invunerblt_Time(A0)                  ; $0030
                lsr.w   #$03, D0
                bcc.s   Offset_0x016820
Offset_0x01681A:
                jsr     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x016820:
                btst    #$01, Obj_Player_Status(A0)                      ; $002B
                beq.s   Offset_0x016852
                tst.w   Obj_P_Invcbility_Time(A0)                        ; $0032
                beq.s   Offset_0x016852
                subq.w  #$01, Obj_P_Invcbility_Time(A0)                  ; $0032
                bne.s   Offset_0x016852
                tst.b   (Boss_Flag).w                                ; $FFFFF7AA
                bne.s   Offset_0x01684C
                cmpi.b  #$0C, Obj_Subtype(A0)                            ; $0028
                bcs.s   Offset_0x01684C
                move.w  (Current_Sound_Buffer).w, D0                 ; $FFFFFF90
                jsr     (Play_Music)                           ; Offset_0x00190C
Offset_0x01684C:
                bclr    #$01, Obj_Player_Status(A0)                      ; $002B
Offset_0x016852:
                btst    #$02, Obj_Player_Status(A0)                      ; $002B
                beq.s   Offset_0x016888
                tst.w   Obj_P_Spd_Shoes_Time(A0)                         ; $0034
                beq.s   Offset_0x016888
                subq.w  #$01, Obj_P_Spd_Shoes_Time(A0)                   ; $0034
                bne.s   Offset_0x016888
                move.w  #$0600, (Miles_Max_Speed).w                  ; $FFFFFEC0
                move.w  #$000C, (Miles_Acceleration).w               ; $FFFFFEC2
                move.w  #$0080, (Miles_Deceleration).w               ; $FFFFFEC4
                bclr    #$02, Obj_Player_Status(A0)                      ; $002B
                move.w  #$00FC, D0
                jmp     (Play_Music)                           ; Offset_0x00190C
Offset_0x016888:
                rts    
;-------------------------------------------------------------------------------
Miles_CPU_Control:                                             ; Offset_0x01688A
                move.b  ($FFFFF606).w, D0                                       
                andi.b  #$7F, D0                                                
                beq.s   Offset_0x01689A                                         
                move.w  #$0258, ($FFFFF702).w                                   
Offset_0x01689A:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.w  ($FFFFF708).w, D0                                       
                move.w  Miles_CPU_States(PC, D0), D0           ; Offset_0x0168AA                       
                jmp     Miles_CPU_States(PC, D0)               ; Offset_0x0168AA
;-------------------------------------------------------------------------------  
Miles_CPU_States:                                              ; Offset_0x0168AA                   
                dc.w    Miles_CPU_Init-Miles_CPU_States        ; Offset_0x0168B4
                dc.w    Miles_CPU_Spawning-Miles_CPU_States    ; Offset_0x0168E6
                dc.w    Miles_CPU_Flying-Miles_CPU_States      ; Offset_0x016940
                dc.w    Miles_CPU_Normal-Miles_CPU_States      ; Offset_0x016A68
                dc.w    Miles_CPU_Panic-Miles_CPU_States       ; Offset_0x016C12
;-------------------------------------------------------------------------------                
Miles_CPU_Init:                                                ; Offset_0x0168B4
                move.w  #$0006, ($FFFFF708).w
                move.b  #$00, Obj_Timer(A0)                              ; $002A
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$0000, Obj_Inertia(A0)                          ; $0014
                move.b  #$02, Obj_Status(A0)                             ; $0022
                move.w  #$0000, ($FFFFF704).w
                rts 
;-------------------------------------------------------------------------------
Miles_CPU_Spawning:                                            ; Offset_0x0168E6    
                move.b  ($FFFFF606).w, D0
                andi.b  #$F0, D0
                bne.s   Miles_CPU_Respawn                      ; Offset_0x01690A
                move.w  ($FFFFFE04).w, D0
                andi.w  #$003F, D0
                bne.s   Offset_0x01693E
                tst.b   Obj_Timer(A1)                                    ; $002A
                bne.s   Offset_0x01693E
                move.b  Obj_Status(A1), D0                               ; $0022
                andi.b  #$D2, D0
                bne.s   Offset_0x01693E
Miles_CPU_Respawn:                                             ; Offset_0x01690A
                move.w  #$0004, ($FFFFF708).w
                move.w  Obj_X(A1), D0                                    ; $0008
                move.w  D0, Obj_X(A0)                                    ; $0008
                move.w  D0, ($FFFFF70A).w
                move.w  Obj_Y(A1), D0                                    ; $000C
                move.w  D0, ($FFFFF70C).w
                subi.w  #$00C0, D0
                move.w  D0, Obj_Y(A0)                                    ; $000C
                ori.w   #$8000, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$00, Obj_Player_Spdsh_Flag(A0)                  ; $0039
                move.w  #$0000, Obj_Player_Spdsh_Cnt(A0)                 ; $003A
Offset_0x01693E:
                rts  
;-------------------------------------------------------------------------------
Miles_CPU_Flying:                                              ; Offset_0x016940
                tst.b   Obj_Flags(A0)                                    ; $0001
                bmi.s   Offset_0x01697E
                addq.w  #$01, ($FFFFF704).w
                cmpi.w  #$012C, ($FFFFF704).w
                bcs.s   Offset_0x016984
                move.w  #$0000, ($FFFFF704).w
                move.w  #$0002, ($FFFFF708).w
                move.b  #$81, Obj_Timer(A0)                              ; $002A
                move.b  #$02, Obj_Status(A0)                             ; $0022
                move.w  #$0000, Obj_X(A0)                                ; $0008
                move.w  #$0000, Obj_Y(A0)                                ; $000C
                move.b  #$20, Obj_Ani_Number(A0)                         ; $001C
                rts
Offset_0x01697E:
                move.w  #$0000, ($FFFFF704).w
Offset_0x016984:
                lea     ($FFFFE500).w, A2
                move.w  #$0010, D2
                lsl.b   #$02, D2
                addq.b  #$04, D2
                move.w  ($FFFFEED2).w, D3
                sub.b   D2, D3
                move.w  $00(A2, D3), ($FFFFF70A).w
                move.w  $02(A2, D3), ($FFFFF70C).w
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   ($FFFFF70A).w, D0
                beq.s   Offset_0x0169F2
                move.w  D0, D2
                bpl.s   Offset_0x0169B2
                neg.w   D2
Offset_0x0169B2:
                lsr.w   #$04, D2
                cmpi.w  #$000C, D2
                bcs.s   Offset_0x0169BC
                moveq   #$0C, D2
Offset_0x0169BC:
                move.b  Obj_Speed(A1), D1                                ; $0010
                bpl.s   Offset_0x0169C4
                neg.b   D1
Offset_0x0169C4:
                add.b   D1, D2
                addq.w  #$01, D2
                tst.w   D0
                bmi.s   Offset_0x0169DE
                bset    #$00, Obj_Status(A0)                             ; $0022
                cmp.w   D0, D2
                bcs.s   Offset_0x0169DA
                move.w  D0, D2
                moveq   #$00, D0
Offset_0x0169DA:
                neg.w   D2
                bra.s   Offset_0x0169EE
Offset_0x0169DE:
                bclr    #$00, Obj_Status(A0)                             ; $0022
                neg.w   D0
                cmp.w   D0, D2
                bcs.s   Offset_0x0169EE
                move.b  D0, D2
                moveq   #$00, D0
Offset_0x0169EE:
                add.w   D2, Obj_X(A0)                                    ; $0008
Offset_0x0169F2:
                moveq   #$01, D2
                move.w  Obj_Y(A0), D1                                    ; $000C
                sub.w   ($FFFFF70C).w, D1
                beq.s   Offset_0x016A06
                bmi.s   Offset_0x016A02
                neg.w   D2
Offset_0x016A02:
                add.w   D2, Obj_Y(A0)                                    ; $000C
Offset_0x016A06:
                lea     ($FFFFE400).w, A2
                move.b  $02(A2, D3), D2
                andi.b  #$D2, D2
                bne.s   Offset_0x016A66
                or.w    D0, D1
                bne.s   Offset_0x016A66
                move.w  #$0006, ($FFFFF708).w
                move.b  #$00, Obj_Timer(A0)                              ; $002A
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$0000, Obj_Inertia(A0)                          ; $0014
                move.b  #$02, Obj_Status(A0)                             ; $0022
                move.w  #$0000, Obj_Player_Control(A0)                   ; $002E
                andi.w  #$7FFF, Obj_Art_VRAM(A0)                         ; $0002
                tst.b   Obj_Art_VRAM(A1)                                 ; $0002
                bpl.s   Offset_0x016A5A
                ori.w   #$8000, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x016A5A:
                move.b  Obj_Player_Top_Solid(A1), Obj_Player_Top_Solid(A0) ; $003E
                move.b  Obj_Player_LRB_Solid(A1), Obj_Player_LRB_Solid(A0) ; $003F
Offset_0x016A66:
                rts  
;-------------------------------------------------------------------------------
Miles_CPU_Normal:                                              ; Offset_0x016A68 
                bsr     Offset_0x016BC0
                tst.w   ($FFFFF702).w
                bne     Offset_0x016B82
                tst.b   Obj_Timer(A0)                                    ; $002A
                bmi     Offset_0x016B82
                tst.w   Obj_Player_Control(A0)                           ; $002E
                beq.s   Offset_0x016A8E
                tst.w   Obj_Inertia(A0)                                  ; $0014
                bne.s   Offset_0x016A8E
                move.w  #$0008, ($FFFFF708).w
Offset_0x016A8E:
                lea     ($FFFFE500).w, A1
                move.w  #$0010, D1
                lsl.b   #$02, D1
                addq.b  #$04, D1
                move.w  ($FFFFEED2).w, D0
                sub.b   D1, D0
                move.w  $00(A1, D0), D2
                move.w  $02(A1, D0), D3
                lea     ($FFFFE400).w, A1
                move.w  $00(A1, D0), D1
                move.b  $02(A1, D0), D4
                move.w  D1, D0
                btst    #$05, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x016AC6
                btst    #$05, D4
                beq     Offset_0x016B60
Offset_0x016AC6:
                sub.w   Obj_X(A0), D2                                    ; $0008
                beq.s   Offset_0x016B14
                bpl.s   Offset_0x016AF2
                neg.w   D2
                cmpi.w  #$0010, D2
                bcs.s   Offset_0x016ADE
                andi.w  #$F3F3, D1
                ori.w   #$0404, D1
Offset_0x016ADE:
                tst.w   Obj_Inertia(A0)                                  ; $0014
                beq.s   Offset_0x016B28
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x016B28
                subq.w  #$01, Obj_X(A0)                                  ; $0008
                bra.s   Offset_0x016B28
Offset_0x016AF2:
                cmpi.w  #$0010, D2
                bcs.s   Offset_0x016B00
                andi.w  #$F3F3, D1
                ori.w   #$0808, D1
Offset_0x016B00:
                tst.w   Obj_Inertia(A0)                                  ; $0014
                beq.s   Offset_0x016B28
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x016B28
                addq.w  #$01, Obj_X(A0)                                  ; $0008
                bra.s   Offset_0x016B28
Offset_0x016B14:
                bclr    #$00, Obj_Status(A0)                             ; $0022
                move.b  D4, D0
                andi.b  #$01, D0
                beq.s   Offset_0x016B28
                bset    #$00, Obj_Status(A0)                             ; $0022
Offset_0x016B28:
                tst.b   ($FFFFF70F).w
                beq.s   Offset_0x016B40
                ori.w   #$7000, D1
                btst    #$01, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x016B7C
                move.b  #$00, ($FFFFF70F).w
Offset_0x016B40:
                move.w  ($FFFFFE04).w, D0
                andi.w  #$00FF, D0
                beq.s   Offset_0x016B50
                cmpi.w  #$0040, D2
                bcc.s   Offset_0x016B7C
Offset_0x016B50:
                sub.w   Obj_Y(A0), D3                                    ; $000C
                beq.s   Offset_0x016B7C
                bpl.s   Offset_0x016B7C
                neg.w   D3
                cmpi.w  #$0020, D3
                bcs.s   Offset_0x016B7C
Offset_0x016B60:
                move.b  ($FFFFFE05).w, D0
                andi.b  #$3F, D0
                bne.s   Offset_0x016B7C
                cmpi.b  #$08, Obj_Ani_Number(A0)                         ; $001C
                beq.s   Offset_0x016B7C
                ori.w   #$7070, D1
                move.b  #$01, ($FFFFF70F).w
Offset_0x016B7C:
                move.w  D1, ($FFFFF606).w
                rts
Offset_0x016B82:
                tst.w   ($FFFFF702).w
                beq.s   Offset_0x016B8C
                subq.w  #$01, ($FFFFF702).w
Offset_0x016B8C:
                rts     
;-------------------------------------------------------------------------------  
Offset_0x016B8E:
                move.w  #$0000, ($FFFFF702).w
                move.w  #$0000, ($FFFFF704).w
                move.w  #$0002, ($FFFFF708).w
                move.b  #$81, Obj_Timer(A0)                              ; $002A
                move.b  #$02, Obj_Status(A0)                             ; $0022
                move.w  #$0000, Obj_X(A0)                                ; $0008
                move.w  #$0000, Obj_Y(A0)                                ; $000C
                move.b  #$20, Obj_Ani_Number(A0)                         ; $001C
                rts
Offset_0x016BC0:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bmi.s   Offset_0x016BF6
                btst    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x016BE6
                moveq   #$00, D0
                move.b  $003D(A0), D0
                lsl.w   #$06, D0
                addi.l  #$FFFFB000, D0
                move.l  D0, A3
                move.b  ($FFFFF70E).w, D0
                cmp.b   (A3), D0
                bne.s   Offset_0x016BF2
Offset_0x016BE6:
                addq.w  #$01, ($FFFFF704).w
                cmpi.w  #$012C, ($FFFFF704).w
                bcs.s   Offset_0x016BFC
Offset_0x016BF2:
                bra     Offset_0x016B8E
Offset_0x016BF6:
                move.w  #$0000, ($FFFFF704).w
Offset_0x016BFC:
                moveq   #$00, D0
                move.b  $003D(A0), D0
                lsl.w   #$06, D0
                addi.l  #$FFFFB000, D0
                move.l  D0, A3
                move.b  (A3), ($FFFFF70E).w
                rts       
;-------------------------------------------------------------------------------
Miles_CPU_Panic:                                               ; Offset_0x016C12
                bsr     Offset_0x016BC0
                tst.w   ($FFFFF702).w
                bne     Offset_0x016C7A
                tst.w   Obj_Player_Control(A0)                           ; $002E
                bne.s   Offset_0x016C7A
                tst.b   Obj_Player_Spdsh_Flag(A0)                        ; $0039
                bne.s   Offset_0x016C50
                tst.w   Obj_Inertia(A0)                                  ; $0014
                bne.s   Offset_0x016C7A
                move.w  #$0202, ($FFFFF606).w
                move.b  ($FFFFFE05).w, D0
                andi.b  #$7F, D0
                beq.s   Offset_0x016C60
                cmpi.b  #$08, Obj_Ani_Number(A0)                         ; $001C
                bne.s   Offset_0x016C7A
                move.w  #$7272, ($FFFFF606).w
                rts
Offset_0x016C50:
                move.w  #$0202, ($FFFFF606).w
                move.b  ($FFFFFE05).w, D0
                andi.b  #$7F, D0
                bne.s   Offset_0x016C6E
Offset_0x016C60:
                move.w  #$0000, ($FFFFF606).w
                move.w  #$0006, ($FFFFF708).w
                rts
Offset_0x016C6E:
                andi.b  #$1F, D0
                bne.s   Offset_0x016C7A
                ori.w   #$7070, ($FFFFF606).w
Offset_0x016C7A:
                rts                 
;-------------------------------------------------------------------------------
Miles_RecordMoves:                                             ; Offset_0x016C7C
                move.w  ($FFFFEED6).w, D0
                lea     ($FFFFE600).w, A1
                lea     $00(A1, D0), A1
                move.w  Obj_X(A0), (A1)+                                 ; $0008
                move.w  Obj_Y(A0), (A1)+                                 ; $000C
                addq.b  #$04, ($FFFFEED7).w
                rts  
;-------------------------------------------------------------------------------
Miles_Water:                                                   ; Offset_0x016C96
                tst.b   (Water_Level_Flag).w                         ; $FFFFF730
                bne.s   Miles_InLevelWithWater                 ; Offset_0x016C9E
Offset_0x016C9C:
                rts
Miles_InLevelWithWater:                                        ; Offset_0x016C9E
                move.w  (Water_Level).w, D0                          ; $FFFFF646
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bge.s   Miles_NotInWater                       ; Offset_0x016CF6
                bset    #$06, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x016C9C
                move.l  A0, A1
                bsr     Resume_Music                           ; Offset_0x01836A
                move.b  #$0A, ($FFFFB300).w
                move.b  #$81, ($FFFFB328).w
                move.l  A0, ($FFFFB33C).w
                move.w  #$0300, (Miles_Max_Speed).w                  ; $FFFFFEC0
                move.w  #$0006, (Miles_Acceleration).w               ; $FFFFFEC2
                move.w  #$0040, (Miles_Deceleration).w               ; $FFFFFEC4
                asr.w   Obj_Speed(A0)                                    ; $0010
                asr.w   Obj_Speed_Y(A0)                                  ; $0012
                asr.w   Obj_Speed_Y(A0)                                  ; $0012
                beq.s   Offset_0x016C9C
                move.w  #$0100, ($FFFFB45C).w
                move.w  #$00AA, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912
;-------------------------------------------------------------------------------                
Miles_NotInWater:                                              ; Offset_0x016CF6
                bclr    #$06, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x016C9C
                move.l  A0, A1
                bsr     Resume_Music                           ; Offset_0x01836A
                move.w  #$0600, (Miles_Max_Speed).w                  ; $FFFFFEC0
                move.w  #$000C, (Miles_Acceleration).w               ; $FFFFFEC2
                move.w  #$0080, (Miles_Deceleration).w               ; $FFFFFEC4
                cmpi.b  #$04, Obj_Routine(A0)                            ; $0024
                beq.s   Offset_0x016D22
                asl.w   Obj_Speed_Y(A0)                                  ; $0012
Offset_0x016D22:
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                beq     Offset_0x016C9C
                move.w  #$0100, ($FFFFB45C).w
                move.l  A0, A1
                bsr     Resume_Music                           ; Offset_0x01836A
                cmpi.w  #$F000, Obj_Speed_Y(A0)                          ; $0012
                bgt.s   Offset_0x016D44
                move.w  #$F000, Obj_Speed_Y(A0)                          ; $0012
Offset_0x016D44:
                move.w  #$00AA, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912 
;-------------------------------------------------------------------------------
Miles_MdNormal:                                                ; Offset_0x016D4E  
                bsr     Miles_Spindash                         ; Offset_0x0173D8
                bsr     Miles_Jump                             ; Offset_0x0172E8
                bsr     Miles_SlopeResist                      ; Offset_0x0174DC
                bsr     Miles_Move                             ; Offset_0x016DF0
                bsr     Miles_Roll                             ; Offset_0x017282
                bsr     Miles_LevelBoundaries                  ; Offset_0x017224
                jsr     (SpeedToPos)                           ; Offset_0x011F96
                bsr     Player_AnglePos                        ; Offset_0x019004
                bsr     Miles_SlopeRepel                       ; Offset_0x01754E
                rts         
;-------------------------------------------------------------------------------
Miles_MdJump:                                                  ; Offset_0x016D76
                bsr     Miles_JumpHeight                       ; Offset_0x017396
                bsr     Miles_ChgJumpDir                       ; Offset_0x0171AA
                bsr     Miles_LevelBoundaries                  ; Offset_0x017224
                jsr     (ObjectFall)                           ; Offset_0x011F6A
                btst    #$06, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x016D96
                subi.w  #$0028, Obj_Speed_Y(A0)                          ; $0012
Offset_0x016D96:
                bsr     Miles_JumpAngle                        ; Offset_0x017590
                bsr     Miles_Floor                            ; Offset_0x0175F0
                rts       
;-------------------------------------------------------------------------------
Miles_MdRoll:                                                  ; Offset_0x016DA0
                tst.b   Obj_Player_Spdsh_Flag(A0)                        ; $0039
                bne.s   Offset_0x016DAA
                bsr     Miles_Jump                             ; Offset_0x0172E8
Offset_0x016DAA:
                bsr     Miles_RollRepel                        ; Offset_0x017512
                bsr     Miles_RollSpeed                        ; Offset_0x017098
                bsr     Miles_LevelBoundaries                  ; Offset_0x017224
                jsr     (SpeedToPos)                           ; Offset_0x011F96
                bsr     Player_AnglePos                        ; Offset_0x019004
                bsr     Miles_SlopeRepel                       ; Offset_0x01754E
                rts         
;-------------------------------------------------------------------------------
Miles_MdJump2:                                                 ; Offset_0x016DC6
                bsr     Miles_JumpHeight                       ; Offset_0x017396
                bsr     Miles_ChgJumpDir                       ; Offset_0x0171AA
                bsr     Miles_LevelBoundaries                  ; Offset_0x017224
                jsr     (ObjectFall)                           ; Offset_0x011F6A
                btst    #$06, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x016DE6
                subi.w  #$0028, Obj_Speed_Y(A0)                          ; $0012
Offset_0x016DE6:
                bsr     Miles_JumpAngle                        ; Offset_0x017590
                bsr     Miles_Floor                            ; Offset_0x0175F0
                rts  
;-------------------------------------------------------------------------------                
Miles_Move:                                                    ; Offset_0x016DF0
                move.w  (Miles_Max_Speed).w, D6                      ; $FFFFFEC0
                move.w  (Miles_Acceleration).w, D5                   ; $FFFFFEC2
                move.w  (Miles_Deceleration).w, D4                   ; $FFFFFEC4
                tst.b   Obj_Player_Status(A0)                            ; $002B
                bmi     Offset_0x016F02
                tst.w   Obj_Player_Control(A0)                           ; $002E
                bne     Offset_0x016ED6
                btst    #$02, ($FFFFF606).w
                beq.s   Offset_0x016E18
                bsr     Offset_0x016F92
Offset_0x016E18:
                btst    #$03, ($FFFFF606).w
                beq.s   Offset_0x016E24
                bsr     Offset_0x017018
Offset_0x016E24:
                move.b  Obj_Angle(A0), D0                                ; $0026
                addi.b  #$20, D0
                andi.b  #$C0, D0
                bne     Offset_0x016ED6
                tst.w   Obj_Inertia(A0)                                  ; $0014
                bne     Offset_0x016ED6
                bclr    #$05, Obj_Status(A0)                             ; $0022
                move.b  #$05, Obj_Ani_Number(A0)                         ; $001C
                btst    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x016E86
                moveq   #$00, D0
                move.b  $003D(A0), D0
                lsl.w   #$06, D0
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                lea     $00(A1, D0), A1
                tst.b   Obj_Status(A1)                                   ; $0022
                bmi.s   Offset_0x016EB8
                moveq   #$00, D1
                move.b  Obj_Width(A1), D1                                ; $0019
                move.w  D1, D2
                add.w   D2, D2
                subq.w  #$04, D2
                add.w   Obj_X(A0), D1                                    ; $0008
                sub.w   Obj_X(A1), D1                                    ; $0008
                cmpi.w  #$0004, D1
                blt.s   Offset_0x016EAA
                cmp.w   D2, D1
                bge.s   Offset_0x016E9A
                bra.s   Offset_0x016EB8
Offset_0x016E86:
                jsr     (Player_HitFloor)                      ; Offset_0x019AD0
                cmpi.w  #$000C, D1
                blt.s   Offset_0x016EB8
                cmpi.b  #$03, Obj_Player_Next_Tilt(A0)                   ; $0036
                bne.s   Offset_0x016EA2
Offset_0x016E9A:
                bclr    #$00, Obj_Status(A0)                             ; $0022
                bra.s   Offset_0x016EB0
Offset_0x016EA2:
                cmpi.b  #$03, Obj_Player_Tilt(A0)                        ; $0037
                bne.s   Offset_0x016EB8
Offset_0x016EAA:
                bset    #$00, Obj_Status(A0)                             ; $0022
Offset_0x016EB0:
                move.b  #$06, Obj_Ani_Number(A0)                         ; $001C
                bra.s   Offset_0x016ED6
Offset_0x016EB8:
                btst    #$00, ($FFFFF606).w
                beq.s   Offset_0x016EC8
                move.b  #$07, Obj_Ani_Number(A0)                         ; $001C
                bra.s   Offset_0x016ED6
Offset_0x016EC8:
                btst    #$01, ($FFFFF606).w
                beq.s   Offset_0x016ED6
                move.b  #$08, Obj_Ani_Number(A0)                         ; $001C
Offset_0x016ED6:
                move.b  ($FFFFF606).w, D0
                andi.b  #$0C, D0
                bne.s   Offset_0x016F02
                move.w  Obj_Inertia(A0), D0                              ; $0014
                beq.s   Offset_0x016F02
                bmi.s   Offset_0x016EF6
                sub.w   D5, D0
                bcc.s   Offset_0x016EF0
                move.w  #$0000, D0
Offset_0x016EF0:
                move.w  D0, Obj_Inertia(A0)                              ; $0014
                bra.s   Offset_0x016F02
Offset_0x016EF6:
                add.w   D5, D0
                bcc.s   Offset_0x016EFE
                move.w  #$0000, D0
Offset_0x016EFE:
                move.w  D0, Obj_Inertia(A0)                              ; $0014
Offset_0x016F02:
                move.b  Obj_Angle(A0), D0                                ; $0026
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  Obj_Inertia(A0), D1                              ; $0014
                asr.l   #$08, D1
                move.w  D1, Obj_Speed(A0)                                ; $0010
                muls.w  Obj_Inertia(A0), D0                              ; $0014
                asr.l   #$08, D0
                move.w  D0, Obj_Speed_Y(A0)                              ; $0012
Offset_0x016F20:
                move.b  Obj_Angle(A0), D0                                ; $0026
                addi.b  #$40, D0
                bmi.s   Offset_0x016F90
                move.b  #$40, D1
                tst.w   Obj_Inertia(A0)                                  ; $0014
                beq.s   Offset_0x016F90
                bmi.s   Offset_0x016F38
                neg.w   D1
Offset_0x016F38:
                move.b  Obj_Angle(A0), D0                                ; $0026
                add.b   D1, D0
                move.w  D0, -(A7)
                bsr     Player_WalkSpeed                       ; Offset_0x019948
                move.w  (A7)+, D0
                tst.w   D1
                bpl.s   Offset_0x016F90
                asl.w   #$08, D1
                addi.b  #$20, D0
                andi.b  #$C0, D0
                beq.s   Offset_0x016F8C
                cmpi.b  #$40, D0
                beq.s   Offset_0x016F7A
                cmpi.b  #$80, D0
                beq.s   Offset_0x016F74
                add.w   D1, Obj_Speed(A0)                                ; $0010
                bset    #$05, Obj_Status(A0)                             ; $0022
                move.w  #$0000, Obj_Inertia(A0)                          ; $0014
                rts
Offset_0x016F74:
                sub.w   D1, Obj_Speed_Y(A0)                              ; $0012
                rts
Offset_0x016F7A:
                sub.w   D1, Obj_Speed(A0)                                ; $0010
                bset    #$05, Obj_Status(A0)                             ; $0022
                move.w  #$0000, Obj_Inertia(A0)                          ; $0014
                rts
Offset_0x016F8C:
                add.w   D1, Obj_Speed_Y(A0)                              ; $0012
Offset_0x016F90:
                rts
Offset_0x016F92:
                move.w  Obj_Inertia(A0), D0                              ; $0014
                beq.s   Offset_0x016F9A
                bpl.s   Offset_0x016FCC
Offset_0x016F9A:
                bset    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x016FAE
                bclr    #$05, Obj_Status(A0)                             ; $0022
                move.b  #$01, Obj_Ani_Flag(A0)                           ; $001D
Offset_0x016FAE:
                sub.w   D5, D0
                move.w  D6, D1
                neg.w   D1
                cmp.w   D1, D0
                bgt.s   Offset_0x016FC0
                add.w   D5, D0
                cmp.w   D1, D0
                ble.s   Offset_0x016FC0
                move.w  D1, D0
Offset_0x016FC0:
                move.w  D0, Obj_Inertia(A0)                              ; $0014
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                rts
Offset_0x016FCC:
                sub.w   D4, D0
                bcc.s   Offset_0x016FD4
                move.w  #$FF80, D0
Offset_0x016FD4:
                move.w  D0, Obj_Inertia(A0)                              ; $0014
                move.b  Obj_Angle(A0), D0                                ; $0026
                addi.b  #$20, D0
                andi.b  #$C0, D0
                bne.s   Offset_0x017016
                cmpi.w  #$0400, D0
                blt.s   Offset_0x017016
                move.b  #$0D, Obj_Ani_Number(A0)                         ; $001C
                bclr    #$00, Obj_Status(A0)                             ; $0022
                move.w  #$00A4, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                cmpi.b  #$0C, Obj_Subtype(A0)                            ; $0028
                bcs.s   Offset_0x017016
                move.b  #$06, ($FFFFB464).w
                move.b  #$15, ($FFFFB45A).w
Offset_0x017016:
                rts
Offset_0x017018:
                move.w  Obj_Inertia(A0), D0                              ; $0014
                bmi.s   Offset_0x01704C
                bclr    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x017032
                bclr    #$05, Obj_Status(A0)                             ; $0022
                move.b  #$01, Obj_Ani_Flag(A0)                           ; $001D
Offset_0x017032:
                add.w   D5, D0
                cmp.w   D6, D0
                blt.s   Offset_0x017040
                sub.w   D5, D0
                cmp.w   D6, D0
                bge.s   Offset_0x017040
                move.w  D6, D0
Offset_0x017040:
                move.w  D0, Obj_Inertia(A0)                              ; $0014
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                rts
Offset_0x01704C:
                add.w   D4, D0
                bcc.s   Offset_0x017054
                move.w  #$0080, D0
Offset_0x017054:
                move.w  D0, Obj_Inertia(A0)                              ; $0014
                move.b  Obj_Angle(A0), D0                                ; $0026
                addi.b  #$20, D0
                andi.b  #$C0, D0
                bne.s   Offset_0x017096
                cmpi.w  #$FC00, D0
                bgt.s   Offset_0x017096
                move.b  #$0D, Obj_Ani_Number(A0)                         ; $001C
                bset    #$00, Obj_Status(A0)                             ; $0022
                move.w  #$00A4, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                cmpi.b  #$0C, Obj_Subtype(A0)                            ; $0028
                bcs.s   Offset_0x017096
                move.b  #$06, ($FFFFB464).w
                move.b  #$15, ($FFFFB45A).w
Offset_0x017096:
                rts
;-------------------------------------------------------------------------------                
Miles_RollSpeed:                                               ; Offset_0x017098
                move.w  (Miles_Max_Speed).w, D6                      ; $FFFFFEC0
                asl.w   #$01, D6
                move.w  (Miles_Acceleration).w, D5                   ; $FFFFFEC2
                asr.w   #$01, D5
                move.w  (Miles_Deceleration).w, D4                   ; $FFFFFEC4
                asr.w   #$02, D4
                tst.b   Obj_Player_Status(A0)                            ; $002B
                bmi     Offset_0x01712E
                tst.w   Obj_Player_Control(A0)                           ; $002E
                bne.s   Offset_0x0170D0
                btst    #$02, ($FFFFF606).w
                beq.s   Offset_0x0170C4
                bsr     Offset_0x017164
Offset_0x0170C4:
                btst    #$03, ($FFFFF606).w
                beq.s   Offset_0x0170D0
                bsr     Offset_0x017188
Offset_0x0170D0:
                move.w  Obj_Inertia(A0), D0                              ; $0014
                beq.s   Offset_0x0170F2
                bmi.s   Offset_0x0170E6
                sub.w   D5, D0
                bcc.s   Offset_0x0170E0
                move.w  #$0000, D0
Offset_0x0170E0:
                move.w  D0, Obj_Inertia(A0)                              ; $0014
                bra.s   Offset_0x0170F2
Offset_0x0170E6:
                add.w   D5, D0
                bcc.s   Offset_0x0170EE
                move.w  #$0000, D0
Offset_0x0170EE:
                move.w  D0, Obj_Inertia(A0)                              ; $0014
Offset_0x0170F2:
                tst.w   Obj_Inertia(A0)                                  ; $0014
                bne.s   Offset_0x01712E
                tst.b   Obj_Player_Spdsh_Flag(A0)                        ; $0039
                bne.s   Offset_0x01711C
                bclr    #$02, Obj_Status(A0)                             ; $0022
                move.b  #$0F, Obj_Height_2(A0)                           ; $0016
                move.b  #$09, Obj_Width_2(A0)                            ; $0017
                move.b  #$05, Obj_Ani_Number(A0)                         ; $001C
                subq.w  #$01, Obj_Y(A0)                                  ; $000C
                bra.s   Offset_0x01712E
Offset_0x01711C:
                move.w  #$0400, Obj_Inertia(A0)                          ; $0014
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01712E
                neg.w   Obj_Inertia(A0)                                  ; $0014
Offset_0x01712E:
                move.b  Obj_Angle(A0), D0                                ; $0026
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  Obj_Inertia(A0), D0                              ; $0014
                asr.l   #$08, D0
                move.w  D0, Obj_Speed_Y(A0)                              ; $0012
                muls.w  Obj_Inertia(A0), D1                              ; $0014
                asr.l   #$08, D1
                cmpi.w  #$1000, D1
                ble.s   Offset_0x017152
                move.w  #$1000, D1
Offset_0x017152:
                cmpi.w  #$F000, D1
                bge.s   Offset_0x01715C
                move.w  #$F000, D1
Offset_0x01715C:
                move.w  D1, Obj_Speed(A0)                                ; $0010
                bra     Offset_0x016F20
Offset_0x017164:
                move.w  Obj_Inertia(A0), D0                              ; $0014
                beq.s   Offset_0x01716C
                bpl.s   Offset_0x01717A
Offset_0x01716C:
                bset    #$00, Obj_Status(A0)                             ; $0022
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                rts
Offset_0x01717A:
                sub.w   D4, D0
                bcc.s   Offset_0x017182
                move.w  #$FF80, D0
Offset_0x017182:
                move.w  D0, Obj_Inertia(A0)                              ; $0014
                rts
Offset_0x017188:
                move.w  Obj_Inertia(A0), D0                              ; $0014
                bmi.s   Offset_0x01719C
                bclr    #$00, Obj_Status(A0)                             ; $0022
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                rts
Offset_0x01719C:
                add.w   D4, D0
                bcc.s   Offset_0x0171A4
                move.w  #$0080, D0
Offset_0x0171A4:
                move.w  D0, Obj_Inertia(A0)                              ; $0014
                rts
;-------------------------------------------------------------------------------                
Miles_ChgJumpDir:                                              ; Offset_0x0171AA
                move.w  (Miles_Max_Speed).w, D6                      ; $FFFFFEC0
                move.w  (Miles_Acceleration).w, D5                   ; $FFFFFEC2
                asl.w   #$01, D5
                btst    #$04, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x0171F4
                move.w  Obj_Speed(A0), D0                                ; $0010
                btst    #$02, ($FFFFF606).w
                beq.s   Offset_0x0171DA
                bset    #$00, Obj_Status(A0)                             ; $0022
                sub.w   D5, D0
                move.w  D6, D1
                neg.w   D1
                cmp.w   D1, D0
                bgt.s   Offset_0x0171DA
                move.w  D1, D0
Offset_0x0171DA:
                btst    #$03, ($FFFFF606).w
                beq.s   Offset_0x0171F0
                bclr    #$00, Obj_Status(A0)                             ; $0022
                add.w   D5, D0
                cmp.w   D6, D0
                blt.s   Offset_0x0171F0
                move.w  D6, D0
Offset_0x0171F0:
                move.w  D0, Obj_Speed(A0)                                ; $0010
Offset_0x0171F4:
                cmpi.w  #$FC00, Obj_Speed_Y(A0)                          ; $0012
                bcs.s   Offset_0x017222
                move.w  Obj_Speed(A0), D0                                ; $0010
                move.w  D0, D1
                asr.w   #$05, D1
                beq.s   Offset_0x017222
                bmi.s   Offset_0x017216
                sub.w   D1, D0
                bcc.s   Offset_0x017210
                move.w  #$0000, D0
Offset_0x017210:
                move.w  D0, Obj_Speed(A0)                                ; $0010
                rts
Offset_0x017216:
                sub.w   D1, D0
                bcs.s   Offset_0x01721E
                move.w  #$0000, D0
Offset_0x01721E:
                move.w  D0, Obj_Speed(A0)                                ; $0010
Offset_0x017222:
                rts
;-------------------------------------------------------------------------------                
Miles_LevelBoundaries:                                         ; Offset_0x017224
                move.l  Obj_X(A0), D1                                    ; $0008
                move.w  Obj_Speed(A0), D0                                ; $0010
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D1
                swap.w  D1
                move.w  (Miles_Level_Limits_Min_X).w, D0             ; $FFFFEEF8
                addi.w  #$0010, D0
                cmp.w   D1, D0
                bhi.s   Offset_0x01726A
                move.w  (Miles_Level_Limits_Max_X).w, D0             ; $FFFFEEFA
                addi.w  #$0128, D0
                tst.b   (Boss_Flag).w                                ; $FFFFF7AA
                bne.s   Offset_0x017252
                addi.w  #$0040, D0
Offset_0x017252:
                cmp.w   D1, D0
                bls.s   Offset_0x01726A
Offset_0x017256:
                move.w  (Miles_Level_Limits_Max_Y).w, D0             ; $FFFFEEFE
                addi.w  #$00E0, D0
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                blt.s   Offset_0x017266
                rts
Offset_0x017266:
                bra     Kill_Miles                             ; Offset_0x017E78
Offset_0x01726A:
                move.w  D0, Obj_X(A0)                                    ; $0008
                move.w  #$0000, Obj_Sub_Y(A0)                            ; $000A
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.w  #$0000, Obj_Inertia(A0)                          ; $0014
                bra.s   Offset_0x017256
;-------------------------------------------------------------------------------                
Miles_Roll:                                                    ; Offset_0x017282
                tst.b   Obj_Player_Status(A0)                            ; $002B
                bmi.s   Offset_0x0172A8
                move.w  Obj_Inertia(A0), D0                              ; $0014
                bpl.s   Offset_0x017290
                neg.w   D0
Offset_0x017290:
                cmpi.w  #$0080, D0
                bcs.s   Offset_0x0172A8
                move.b  ($FFFFF606).w, D0
                andi.b  #$0C, D0
                bne.s   Offset_0x0172A8
                btst    #$01, ($FFFFF606).w
                bne.s   Offset_0x0172AA
Offset_0x0172A8:
                rts
Offset_0x0172AA:
                btst    #$02, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x0172B4
                rts
Offset_0x0172B4:
                bset    #$02, Obj_Status(A0)                             ; $0022
                move.b  #$0E, Obj_Height_2(A0)                           ; $0016
                move.b  #$07, Obj_Width_2(A0)                            ; $0017
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                addq.w  #$01, Obj_Y(A0)                                  ; $000C
                move.w  #$00BE, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                tst.w   Obj_Inertia(A0)                                  ; $0014
                bne.s   Offset_0x0172E6
                move.w  #$0200, Obj_Inertia(A0)                          ; $0014
Offset_0x0172E6:
                rts
;-------------------------------------------------------------------------------                
Miles_Jump:                                                    ; Offset_0x0172E8
                move.b  ($FFFFF607).w, D0
                andi.b  #$70, D0
                beq     Offset_0x01738C
                moveq   #$00, D0
                move.b  Obj_Angle(A0), D0                                ; $0026
                addi.b  #$80, D0
                bsr     CalcRoomOverHead                       ; Offset_0x0199CE
                cmpi.w  #$0006, D1
                blt     Offset_0x01738C
                move.w  #$0680, D2
                btst    #$06, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01731A
                move.w  #$0380, D2
Offset_0x01731A:
                moveq   #$00, D0
                move.b  Obj_Angle(A0), D0                                ; $0026
                subi.b  #$40, D0
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  D2, D1
                asr.l   #$08, D1
                add.w   D1, Obj_Speed(A0)                                ; $0010
                muls.w  D2, D0
                asr.l   #$08, D0
                add.w   D0, Obj_Speed_Y(A0)                              ; $0012
                bset    #$01, Obj_Status(A0)                             ; $0022
                bclr    #$05, Obj_Status(A0)                             ; $0022
                addq.l  #$04, A7
                move.b  #$01, Obj_Player_Jump(A0)                        ; $003C
                clr.b   Obj_Player_St_Convex(A0)                         ; $0038
                move.w  #$00A0, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                move.b  #$0F, Obj_Height_2(A0)                           ; $0016
                move.b  #$09, Obj_Width_2(A0)                            ; $0017
                btst    #$02, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x01738E
                move.b  #$0E, Obj_Height_2(A0)                           ; $0016
                move.b  #$07, Obj_Width_2(A0)                            ; $0017
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                bset    #$02, Obj_Status(A0)                             ; $0022
                addq.w  #$01, Obj_Y(A0)                                  ; $000C
Offset_0x01738C:
                rts
Offset_0x01738E:
                bset    #$04, Obj_Status(A0)                             ; $0022
                rts
;-------------------------------------------------------------------------------                
Miles_JumpHeight:                                              ; Offset_0x017396
                tst.b   Obj_Player_Jump(A0)                              ; $003C
                beq.s   Offset_0x0173C2
                move.w  #$FC00, D1
                btst    #$06, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x0173AC
                move.w  #$FE00, D1
Offset_0x0173AC:
                cmp.w   Obj_Speed_Y(A0), D1                              ; $0012
                ble.s   Offset_0x0173C0
                move.b  ($FFFFF606).w, D0
                andi.b  #$70, D0
                bne.s   Offset_0x0173C0
                move.w  D1, Obj_Speed_Y(A0)                              ; $0012
Offset_0x0173C0:
                rts
Offset_0x0173C2:
                tst.b   Obj_Player_Spdsh_Flag(A0)                        ; $0039
                bne.s   Offset_0x0173D6
                cmpi.w  #$F040, Obj_Speed_Y(A0)                          ; $0012
                bge.s   Offset_0x0173D6
                move.w  #$F040, Obj_Speed_Y(A0)                          ; $0012
Offset_0x0173D6:
                rts
;-------------------------------------------------------------------------------                
Miles_Spindash:                                                ; Offset_0x0173D8
                tst.b   Obj_Player_Spdsh_Flag(A0)                        ; $0039
                bne.s   Offset_0x017420
                cmpi.b  #$08, Obj_Ani_Number(A0)                         ; $001C
                bne.s   Offset_0x01741E
                move.b  ($FFFFF607).w, D0
                andi.b  #$70, D0
                beq     Offset_0x01741E
                move.b  #$09, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$00E0, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                addq.l  #$04, A7
                move.b  #$01, Obj_Player_Spdsh_Flag(A0)                  ; $0039
                move.w  #$0000, Obj_Player_Spdsh_Cnt(A0)                 ; $003A
                cmpi.b  #$0C, Obj_Subtype(A0)                            ; $0028
                bcs.s   Offset_0x01741E
                move.b  #$02, ($FFFFB45C).w
Offset_0x01741E:
                rts
Offset_0x017420:
                move.b  ($FFFFF606).w, D0
                btst    #$01, D0
                bne.s   Offset_0x017490
                move.b  #$0E, Obj_Height_2(A0)                           ; $0016
                move.b  #$07, Obj_Width_2(A0)                            ; $0017
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                addq.w  #$01, Obj_Y(A0)                                  ; $000C
                move.b  #$00, Obj_Player_Spdsh_Flag(A0)                  ; $0039
                move.w  #$2000, ($FFFFEED4).w
                moveq   #$00, D0
                move.b  Obj_Player_Spdsh_Cnt(A0), D0                     ; $003A
                add.w   D0, D0
                move.w  Miles_Spindash_Speed(PC, D0), Obj_Inertia(A0) ; Offset_0x01747E, $0014
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x017466
                neg.w   Obj_Inertia(A0)                                  ; $0014
Offset_0x017466:
                bset    #$02, Obj_Status(A0)                             ; $0022
                move.b  #$00, ($FFFFB45C).w
                move.w  #$00BC, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                bra.s   Offset_0x0174D8    
;-------------------------------------------------------------------------------
Miles_Spindash_Speed:                                          ; Offset_0x01747E   
                dc.w    $0800, $0880, $0900, $0980, $0A00, $0A80, $0B00, $0B80
                dc.w    $0C00    
;-------------------------------------------------------------------------------
Offset_0x017490:
                tst.w   Obj_Player_Spdsh_Cnt(A0)                         ; $003A
                beq.s   Offset_0x0174A8
                move.w  Obj_Player_Spdsh_Cnt(A0), D0                     ; $003A
                lsr.w   #$05, D0
                sub.w   D0, Obj_Player_Spdsh_Cnt(A0)                     ; $003A
                bcc.s   Offset_0x0174A8
                move.w  #$0000, Obj_Player_Spdsh_Cnt(A0)                 ; $003A
Offset_0x0174A8:
                move.b  ($FFFFF607).w, D0
                andi.b  #$70, D0
                beq     Offset_0x0174D8
                move.w  #$0900, Obj_Ani_Number(A0)                       ; $001C
                move.w  #$00E0, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                addi.w  #$0200, Obj_Player_Spdsh_Cnt(A0)                 ; $003A
                cmpi.w  #$0800, Obj_Player_Spdsh_Cnt(A0)                 ; $003A
                bcs.s   Offset_0x0174D8
                move.w  #$0800, Obj_Player_Spdsh_Cnt(A0)                 ; $003A
Offset_0x0174D8:
                addq.l  #$04, A7
                rts
;-------------------------------------------------------------------------------
Miles_SlopeResist:                                             ; Offset_0x0174DC
                move.b  Obj_Angle(A0), D0                                ; $0026
                addi.b  #$60, D0
                cmpi.b  #$C0, D0
                bcc.s   Offset_0x017510
                move.b  Obj_Angle(A0), D0                                ; $0026
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  #$0020, D0
                asr.l   #$08, D0
                tst.w   Obj_Inertia(A0)                                  ; $0014
                beq.s   Offset_0x017510
                bmi.s   Offset_0x01750C
                tst.w   D0
                beq.s   Offset_0x01750A
                add.w   D0, Obj_Inertia(A0)                              ; $0014
Offset_0x01750A:
                rts
Offset_0x01750C:
                add.w   D0, Obj_Inertia(A0)                              ; $0014
Offset_0x017510:
                rts
;-------------------------------------------------------------------------------                
Miles_RollRepel:                                               ; Offset_0x017512
                move.b  Obj_Angle(A0), D0                                ; $0026
                addi.b  #$60, D0
                cmpi.b  #$C0, D0
                bcc.s   Offset_0x01754C
                move.b  Obj_Angle(A0), D0                                ; $0026
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  #$0050, D0
                asr.l   #$08, D0
                tst.w   Obj_Inertia(A0)                                  ; $0014
                bmi.s   Offset_0x017542
                tst.w   D0
                bpl.s   Offset_0x01753C
                asr.l   #$02, D0
Offset_0x01753C:
                add.w   D0, Obj_Inertia(A0)                              ; $0014
                rts
Offset_0x017542:
                tst.w   D0
                bmi.s   Offset_0x017548
                asr.l   #$02, D0
Offset_0x017548:
                add.w   D0, Obj_Inertia(A0)                              ; $0014
Offset_0x01754C:
                rts
;-------------------------------------------------------------------------------                
Miles_SlopeRepel:                                              ; Offset_0x01754E
                nop
                tst.b   Obj_Player_St_Convex(A0)                         ; $0038
                bne.s   Offset_0x017588
                tst.w   Obj_Player_Control(A0)                           ; $002E
                bne.s   Offset_0x01758A
                move.b  Obj_Angle(A0), D0                                ; $0026
                addi.b  #$20, D0
                andi.b  #$C0, D0
                beq.s   Offset_0x017588
                move.w  Obj_Inertia(A0), D0                              ; $0014
                bpl.s   Offset_0x017572
                neg.w   D0
Offset_0x017572:
                cmpi.w  #$0280, D0
                bcc.s   Offset_0x017588
                clr.w   Obj_Inertia(A0)                                  ; $0014
                bset    #$01, Obj_Status(A0)                             ; $0022
                move.w  #$001E, Obj_Player_Control(A0)                   ; $002E
Offset_0x017588:
                rts
Offset_0x01758A:
                subq.w  #$01, Obj_Player_Control(A0)                     ; $002E
                rts
;-------------------------------------------------------------------------------                
Miles_JumpAngle:                                               ; Offset_0x017590
                move.b  Obj_Angle(A0), D0                                ; $0026
                beq.s   Offset_0x0175AA
                bpl.s   Offset_0x0175A0
                addq.b  #$02, D0
                bcc.s   Offset_0x01759E
                moveq   #$00, D0
Offset_0x01759E:
                bra.s   Offset_0x0175A6
Offset_0x0175A0:
                subq.b  #$02, D0
                bcc.s   Offset_0x0175A6
                moveq   #$00, D0
Offset_0x0175A6:
                move.b  D0, Obj_Angle(A0)                                ; $0026
Offset_0x0175AA:
                move.b  Obj_Flip_Angle(A0), D0                           ; $0027
                beq.s   Offset_0x0175EE
                tst.w   Obj_Inertia(A0)                                  ; $0014
                bmi.s   Offset_0x0175CE
Offset_0x0175B6:
                move.b  Obj_Player_Flip_Speed(A0), D1                    ; $002D
                add.b   D1, D0
                bcc.s   Offset_0x0175CC
                subq.b  #$01, Obj_P_Flips_Remaining(A0)                  ; $002C
                bcc.s   Offset_0x0175CC
                move.b  #$00, Obj_P_Flips_Remaining(A0)                  ; $002C
                moveq   #$00, D0
Offset_0x0175CC:
                bra.s   Offset_0x0175EA
Offset_0x0175CE:
                tst.b   Obj_Player_Flip_Flag(A0)                         ; $0029
                bne.s   Offset_0x0175B6
                move.b  Obj_Player_Flip_Speed(A0), D1                    ; $002D
                sub.b   D1, D0
                bcc.s   Offset_0x0175EA
                subq.b  #$01, Obj_P_Flips_Remaining(A0)                  ; $002C
                bcc.s   Offset_0x0175EA
                move.b  #$00, Obj_P_Flips_Remaining(A0)                  ; $002C
                moveq   #$00, D0
Offset_0x0175EA:
                move.b  D0, Obj_Flip_Angle(A0)                           ; $0027
Offset_0x0175EE:
                rts
;-------------------------------------------------------------------------------                
Miles_Floor:                                                   ; Offset_0x0175F0
                move.l  #Primary_Colision_Data_Buffer, (Current_Colision_Pointer).w   ; $FFFFD000, $FFFFF796
                cmpi.b  #$0C, Obj_Player_Top_Solid(A0)                   ; $003E
                beq.s   Offset_0x017608
                move.l  #Secundary_Colision_Data_Buffer, (Current_Colision_Pointer).w ; $FFFFD600, $FFFFF796
Offset_0x017608:
                move.b  Obj_Player_LRB_Solid(A0), D5                     ; $003F
                move.w  Obj_Speed(A0), D1                                ; $0010
                move.w  Obj_Speed_Y(A0), D2                              ; $0012
                jsr     (CalcAngle)                            ; Offset_0x003C02
                subi.b  #$20, D0
                andi.b  #$C0, D0
                cmpi.b  #$40, D0
                beq     Offset_0x0176D2
                cmpi.b  #$80, D0
                beq     Offset_0x01772E
                cmpi.b  #$C0, D0
                beq     Offset_0x01778A
                bsr     Player_HitWall                         ; Offset_0x019DD8
                tst.w   D1
                bpl.s   Offset_0x01764C
                sub.w   D1, Obj_X(A0)                                    ; $0008
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
Offset_0x01764C:
                bsr     Offset_0x019C56
                tst.w   D1
                bpl.s   Offset_0x01765E
                add.w   D1, Obj_X(A0)                                    ; $0008
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
Offset_0x01765E:
                bsr     Offset_0x019A12
                tst.w   D1
                bpl.s   Offset_0x0176D0
                move.b  Obj_Speed_Y(A0), D2                              ; $0012
                addq.b  #$08, D2
                neg.b   D2
                cmp.b   D2, D1
                bge.s   Offset_0x017676
                cmp.b   D2, D0
                blt.s   Offset_0x0176D0
Offset_0x017676:
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.b  D3, Obj_Angle(A0)                                ; $0026
                bsr     Miles_ResetMilesOnFloor                ; Offset_0x0177E6
                move.b  D3, D0
                addi.b  #$20, D0
                andi.b  #$40, D0
                bne.s   Offset_0x0176AE
                move.b  D3, D0
                addi.b  #$10, D0
                andi.b  #$20, D0
                beq.s   Offset_0x0176A0
                asr.w   Obj_Speed_Y(A0)                                  ; $0012
                bra.s   Offset_0x0176C2
Offset_0x0176A0:
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.w  Obj_Speed(A0), Obj_Inertia(A0)            ; $0010, $0014
                rts
Offset_0x0176AE:
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                cmpi.w  #$0FC0, Obj_Speed_Y(A0)                          ; $0012
                ble.s   Offset_0x0176C2
                move.w  #$0FC0, Obj_Speed_Y(A0)                          ; $0012
Offset_0x0176C2:
                move.w  Obj_Speed_Y(A0), Obj_Inertia(A0)          ; $0012, $0014
                tst.b   D3
                bpl.s   Offset_0x0176D0
                neg.w   Obj_Inertia(A0)                                  ; $0014
Offset_0x0176D0:
                rts
Offset_0x0176D2:
                bsr     Player_HitWall                         ; Offset_0x019DD8
                tst.w   D1
                bpl.s   Offset_0x0176EC
                sub.w   D1, Obj_X(A0)                                    ; $0008
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.w  Obj_Speed_Y(A0), Obj_Inertia(A0)          ; $0012, $0014
                rts
Offset_0x0176EC:
                bsr     Player_DontRunOnWalls                  ; Offset_0x019CA8
                tst.w   D1
                bpl.s   Offset_0x017706
                sub.w   D1, Obj_Y(A0)                                    ; $000C
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bpl.s   Offset_0x017704
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
Offset_0x017704:
                rts
Offset_0x017706:
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x01772C
                bsr     Offset_0x019A12
                tst.w   D1
                bpl.s   Offset_0x01772C
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.b  D3, Obj_Angle(A0)                                ; $0026
                bsr     Miles_ResetMilesOnFloor                ; Offset_0x0177E6
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.w  Obj_Speed(A0), Obj_Inertia(A0)            ; $0010, $0014
Offset_0x01772C:
                rts
Offset_0x01772E:
                bsr     Player_HitWall                         ; Offset_0x019DD8
                tst.w   D1
                bpl.s   Offset_0x017740
                sub.w   D1, Obj_X(A0)                                    ; $0008
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
Offset_0x017740:
                bsr     Offset_0x019C56
                tst.w   D1
                bpl.s   Offset_0x017752
                add.w   D1, Obj_X(A0)                                    ; $0008
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
Offset_0x017752:
                bsr     Player_DontRunOnWalls                  ; Offset_0x019CA8
                tst.w   D1
                bpl.s   Offset_0x017788
                sub.w   D1, Obj_Y(A0)                                    ; $000C
                move.b  D3, D0
                addi.b  #$20, D0
                andi.b  #$40, D0
                bne.s   Offset_0x017772
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                rts
Offset_0x017772:
                move.b  D3, Obj_Angle(A0)                                ; $0026
                bsr     Miles_ResetMilesOnFloor                ; Offset_0x0177E6
                move.w  Obj_Speed_Y(A0), Obj_Inertia(A0)          ; $0012, $0014
                tst.b   D3
                bpl.s   Offset_0x017788
                neg.w   Obj_Inertia(A0)                                  ; $0014
Offset_0x017788:
                rts
Offset_0x01778A:
                bsr     Offset_0x019C56
                tst.w   D1
                bpl.s   Offset_0x0177A4
                add.w   D1, Obj_X(A0)                                    ; $0008
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.w  Obj_Speed_Y(A0), Obj_Inertia(A0)          ; $0012, $0014
                rts
Offset_0x0177A4:
                bsr     Player_DontRunOnWalls                  ; Offset_0x019CA8
                tst.w   D1
                bpl.s   Offset_0x0177BE
                sub.w   D1, Obj_Y(A0)                                    ; $000C
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bpl.s   Offset_0x0177BC
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
Offset_0x0177BC:
                rts
Offset_0x0177BE:
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x0177E4
                bsr     Offset_0x019A12
                tst.w   D1
                bpl.s   Offset_0x0177E4
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.b  D3, Obj_Angle(A0)                                ; $0026
                bsr     Miles_ResetMilesOnFloor                ; Offset_0x0177E6
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.w  Obj_Speed(A0), Obj_Inertia(A0)            ; $0010, $0014
Offset_0x0177E4:
                rts
;-------------------------------------------------------------------------------
Miles_ResetMilesOnFloor:                                       ; Offset_0x0177E6
                tst.b   Obj_Player_Spdsh_Flag(A0)                        ; $0039
                bne.s   Offset_0x017816
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
;-------------------------------------------------------------------------------
Miles_ResetOnFloor:                                            ; Offset_0x0177F2
                btst    #$02, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x017816
                bclr    #$02, Obj_Status(A0)                             ; $0022
                move.b  #$0F, Obj_Height_2(A0)                           ; $0016
                move.b  #$09, Obj_Width_2(A0)                            ; $0017
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                subq.w  #$01, Obj_Y(A0)                                  ; $000C
Offset_0x017816:
                bclr    #$01, Obj_Status(A0)                             ; $0022
                bclr    #$05, Obj_Status(A0)                             ; $0022
                bclr    #$04, Obj_Status(A0)                             ; $0022
                move.b  #$00, Obj_Player_Jump(A0)                        ; $003C
                move.w  #$0000, ($FFFFF7D0).w
                move.b  #$00, Obj_Flip_Angle(A0)                         ; $0027
                move.b  #$00, Obj_Player_Flip_Flag(A0)                   ; $0029
                move.b  #$00, Obj_P_Flips_Remaining(A0)                  ; $002C
                cmpi.b  #$14, Obj_Ani_Number(A0)                         ; $001C
                bne.s   Offset_0x017854
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
Offset_0x017854:
                rts      
;-------------------------------------------------------------------------------
Miles_Hurt:                                                    ; Offset_0x017856
                jsr     (SpeedToPos)                           ; Offset_0x011F96
                addi.w  #$0030, Obj_Speed_Y(A0)                          ; $0012
                btst    #$06, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x017870
                subi.w  #$0020, Obj_Speed_Y(A0)                          ; $0012
Offset_0x017870:
                bsr     Miles_HurtStop                         ; Offset_0x01788A
                bsr     Miles_LevelBoundaries                  ; Offset_0x017224
                bsr     Miles_RecordMoves                      ; Offset_0x016C7C
                bsr     Miles_Animate                          ; Offset_0x017922
                bsr     Load_Miles_Dynamic_PLC                 ; Offset_0x017D0A
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Miles_HurtStop:                                                ; Offset_0x01788A
                move.w  (Miles_Level_Limits_Max_Y).w, D0             ; $FFFFEEFE
                addi.w  #$00E0, D0
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                blt     Kill_Miles                             ; Offset_0x017E78
                bsr     Miles_Floor                            ; Offset_0x0175F0
                btst    #$01, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x0178CC
                moveq   #$00, D0
                move.w  D0, Obj_Speed_Y(A0)                              ; $0012
                move.w  D0, Obj_Speed(A0)                                ; $0010
                move.w  D0, Obj_Inertia(A0)                              ; $0014
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0078, Obj_P_Invunerblt_Time(A0)                ; $0030
                move.b  #$00, Obj_Player_Spdsh_Flag(A0)                  ; $0039
Offset_0x0178CC:
                rts      
;-------------------------------------------------------------------------------
Miles_Death:                                                   ; Offset_0x0178CE
                bsr     Miles_GameOver                         ; Offset_0x0178EA
                jsr     (ObjectFall)                           ; Offset_0x011F6A
                bsr     Miles_RecordMoves                      ; Offset_0x016C7C
                bsr     Miles_Animate                          ; Offset_0x017922
                bsr     Load_Miles_Dynamic_PLC                 ; Offset_0x017D0A
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Miles_GameOver:                                                ; Offset_0x0178EA
                move.b  #$00, Obj_Player_Spdsh_Flag(A0)                  ; $0039
                move.w  (Miles_Level_Limits_Max_Y).w, D0             ; $FFFFEEFE
                addi.w  #$0100, D0
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bge     Offset_0x01790C
                bsr     Offset_0x016B8E
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                nop
Offset_0x01790C:
                rts  
;-------------------------------------------------------------------------------  
Miles_ResetLevel:                                              ; Offset_0x01790E
                tst.w   Obj_Player_Spdsh_Cnt(A0)                         ; $003A
                beq.s   Offset_0x017920
                subq.w  #$01, Obj_Player_Spdsh_Cnt(A0)                   ; $003A
                bne.s   Offset_0x017920
                move.w  #$0001, ($FFFFFE02).w
Offset_0x017920:
                rts
;-------------------------------------------------------------------------------                
Miles_Animate:                                                 ; Offset_0x017922
                lea     (Offset_0x017B96), A1
Miles_Animate_A1:                                              ; Offset_0x017928
                moveq   #$00, D0
                move.b  Obj_Ani_Number(A0), D0                           ; $001C
                cmp.b   Obj_Ani_Flag(A0), D0                             ; $001D
                beq.s   Offset_0x01794A
                move.b  D0, Obj_Ani_Flag(A0)                             ; $001D
                move.b  #$00, Obj_Ani_Frame(A0)                          ; $001B
                move.b  #$00, Obj_Ani_Time(A0)                           ; $001E
                bclr    #$05, Obj_Status(A0)                             ; $0022
Offset_0x01794A:
                add.w   D0, D0
                adda.w  $00(A1, D0), A1
                move.b  (A1), D0
                bmi.s   Offset_0x0179BA
                move.b  Obj_Status(A0), D1                               ; $0022
                andi.b  #$01, D1
                andi.b  #$FC, Obj_Flags(A0)                              ; $0001
                or.b    D1, Obj_Flags(A0)                                ; $0001
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x017988
                move.b  D0, Obj_Ani_Time(A0)                             ; $001E
Offset_0x017970:
                moveq   #$00, D1
                move.b  Obj_Ani_Frame(A0), D1                            ; $001B
                move.b  $01(A1, D1), D0
                cmpi.b  #$F0, D0
                bcc.s   Offset_0x01798A
Offset_0x017980:
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                addq.b  #$01, Obj_Ani_Frame(A0)                          ; $001B
Offset_0x017988:
                rts
Offset_0x01798A:
                addq.b  #$01, D0
                bne.s   Offset_0x01799A
                move.b  #$00, Obj_Ani_Frame(A0)                          ; $001B
                move.b  Obj_Flags(A1), D0                                ; $0001
                bra.s   Offset_0x017980
Offset_0x01799A:
                addq.b  #$01, D0
                bne.s   Offset_0x0179AE
                move.b  $02(A1, D1), D0
                sub.b   D0, Obj_Ani_Frame(A0)                            ; $001B
                sub.b   D0, D1
                move.b  $01(A1, D1), D0
                bra.s   Offset_0x017980
Offset_0x0179AE:
                addq.b  #$01, D0
                bne.s   Offset_0x0179B8
                move.b  $02(A1, D1), Obj_Ani_Number(A0)                  ; $001C
Offset_0x0179B8:
                rts
Offset_0x0179BA:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x017988
                addq.b  #$01, D0
                bne     Offset_0x017ACC
                moveq   #$00, D0
                move.b  Obj_Flip_Angle(A0), D0                           ; $0027
                bne     Offset_0x017A66
                moveq   #$00, D1
                move.b  Obj_Angle(A0), D0                                ; $0026
                bmi.s   Offset_0x0179DC
                beq.s   Offset_0x0179DC
                subq.b  #$01, D0
Offset_0x0179DC:
                move.b  Obj_Status(A0), D2                               ; $0022
                andi.b  #$01, D2
                bne.s   Offset_0x0179E8
                not.b   D0
Offset_0x0179E8:
                addi.b  #$10, D0
                bpl.s   Offset_0x0179F0
                moveq   #$03, D1
Offset_0x0179F0:
                andi.b  #$FC, Obj_Flags(A0)                              ; $0001
                eor.b   D1, D2
                or.b    D2, Obj_Flags(A0)                                ; $0001
                btst    #$05, Obj_Status(A0)                             ; $0022
                bne     Offset_0x017B10
                lsr.b   #$04, D0
                andi.b  #$06, D0
                move.w  Obj_Inertia(A0), D2                              ; $0014
                bpl.s   Offset_0x017A14
                neg.w   D2
Offset_0x017A14:
                tst.b   Obj_Player_Status(A0)                            ; $002B
                bpl     Offset_0x017A1E
                add.w   D2, D2
Offset_0x017A1E:
                move.b  D0, D3
                add.b   D3, D3
                add.b   D3, D3
                lea     (Offset_0x017BD8), A1
                cmpi.w  #$0600, D2
                bcs.s   Offset_0x017A4C
                lea     (Offset_0x017BE2), A1
                move.b  D0, D1
                lsr.b   #$01, D1
                add.b   D1, D0
                add.b   D0, D0
                move.b  D0, D3
                cmpi.w  #$0700, D2
                bcs.s   Offset_0x017A4C
                lea     (Offset_0x017CD4), A1
Offset_0x017A4C:
                neg.w   D2
                addi.w  #$0800, D2
                bpl.s   Offset_0x017A56
                moveq   #$00, D2
Offset_0x017A56:
                lsr.w   #$08, D2
                move.b  D2, Obj_Ani_Time(A0)                             ; $001E
                bsr     Offset_0x017970
                add.b   D3, Obj_Map_Id(A0)                               ; $001A
                rts
Offset_0x017A66:
                move.b  Obj_Flip_Angle(A0), D0                           ; $0027
                moveq   #$00, D1
                move.b  Obj_Status(A0), D2                               ; $0022
                andi.b  #$01, D2
                bne.s   Offset_0x017A94
                andi.b  #$FC, Obj_Flags(A0)                              ; $0001
                addi.b  #$0B, D0
                divu.w  #$0016, D0
                addi.b  #$75, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                move.b  #$00, Obj_Ani_Time(A0)                           ; $001E
                rts
Offset_0x017A94:
                andi.b  #$FC, Obj_Flags(A0)                              ; $0001
                tst.b   Obj_Player_Flip_Flag(A0)                         ; $0029
                beq.s   Offset_0x017AAC
                ori.b   #$01, Obj_Flags(A0)                              ; $0001
                addi.b  #$0B, D0
                bra.s   Offset_0x017AB8
Offset_0x017AAC:
                ori.b   #$03, Obj_Flags(A0)                              ; $0001
                neg.b   D0
                addi.b  #$8F, D0
Offset_0x017AB8:
                divu.w  #$0016, D0
                addi.b  #$75, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                move.b  #$00, Obj_Ani_Time(A0)                           ; $001E
                rts
Offset_0x017ACC:
                addq.b  #$01, D0
                bne.s   Offset_0x017B42
                move.w  Obj_Inertia(A0), D2                              ; $0014
                bpl.s   Offset_0x017AD8
                neg.w   D2
Offset_0x017AD8:
                lea     (Offset_0x017BF1), A1
                cmpi.w  #$0600, D2
                bcc.s   Offset_0x017AEA
                lea     (Offset_0x017BEC), A1
Offset_0x017AEA:
                neg.w   D2
                addi.w  #$0400, D2
                bpl.s   Offset_0x017AF4
                moveq   #$00, D2
Offset_0x017AF4:
                lsr.w   #$08, D2
                move.b  D2, Obj_Ani_Time(A0)                             ; $001E
                move.b  Obj_Status(A0), D1                               ; $0022
                andi.b  #$01, D1
                andi.b  #$FC, Obj_Flags(A0)                              ; $0001
                or.b    D1, Obj_Flags(A0)                                ; $0001
                bra     Offset_0x017970
Offset_0x017B10:
                move.w  Obj_Inertia(A0), D2                              ; $0014
                bmi.s   Offset_0x017B18
                neg.w   D2
Offset_0x017B18:
                addi.w  #$0800, D2
                bpl.s   Offset_0x017B20
                moveq   #$00, D2
Offset_0x017B20:
                lsr.w   #$06, D2
                move.b  D2, Obj_Ani_Time(A0)                             ; $001E
                lea     (Offset_0x017BF6), A1
                move.b  Obj_Status(A0), D1                               ; $0022
                andi.b  #$01, D1
                andi.b  #$FC, Obj_Flags(A0)                              ; $0001
                or.b    D1, Obj_Flags(A0)                                ; $0001
                bra     Offset_0x017970
Offset_0x017B42:
                move.w  ($FFFFB050).w, D1
                move.w  ($FFFFB052).w, D2
                jsr     (CalcAngle)                            ; Offset_0x003C02
                moveq   #$00, D1
                move.b  Obj_Status(A0), D2                               ; $0022
                andi.b  #$01, D2
                bne.s   Offset_0x017B60
                not.b   D0
                bra.s   Offset_0x017B64
Offset_0x017B60:
                addi.b  #$80, D0
Offset_0x017B64:
                addi.b  #$10, D0
                bpl.s   Offset_0x017B6C
                moveq   #$03, D1
Offset_0x017B6C:
                andi.b  #$FC, Obj_Flags(A0)                              ; $0001
                eor.b   D1, D2
                or.b    D2, Obj_Flags(A0)                                ; $0001
                lsr.b   #$03, D0
                andi.b  #$0C, D0
                move.b  D0, D3
                lea     (Offset_0x017E46), A1
                move.b  #$03, Obj_Ani_Time(A0)                           ; $001E
                bsr     Offset_0x017970
                add.b   D3, Obj_Map_Id(A0)                               ; $001A
                rts    
;-------------------------------------------------------------------------------
Offset_0x017B96:                                                                          
                dc.w    Offset_0x017BD8-Offset_0x017B96
                dc.w    Offset_0x017BE2-Offset_0x017B96
                dc.w    Offset_0x017BEC-Offset_0x017B96
                dc.w    Offset_0x017BF1-Offset_0x017B96
                dc.w    Offset_0x017BF6-Offset_0x017B96
                dc.w    Offset_0x017C00-Offset_0x017B96
                dc.w    Offset_0x017C3E-Offset_0x017B96
                dc.w    Offset_0x017C56-Offset_0x017B96
                dc.w    Offset_0x017C59-Offset_0x017B96
                dc.w    Offset_0x017C5C-Offset_0x017B96
                dc.w    Offset_0x017C61-Offset_0x017B96
                dc.w    Offset_0x017C64-Offset_0x017B96
                dc.w    Offset_0x017C6A-Offset_0x017B96
                dc.w    Offset_0x017C6E-Offset_0x017B96
                dc.w    Offset_0x017C75-Offset_0x017B96
                dc.w    Offset_0x017C79-Offset_0x017B96
                dc.w    Offset_0x017C80-Offset_0x017B96
                dc.w    Offset_0x017C8F-Offset_0x017B96
                dc.w    Offset_0x017C93-Offset_0x017B96
                dc.w    Offset_0x017C99-Offset_0x017B96
                dc.w    Offset_0x017C9E-Offset_0x017B96
                dc.w    Offset_0x017CA2-Offset_0x017B96
                dc.w    Offset_0x017CA9-Offset_0x017B96
                dc.w    Offset_0x017CAC-Offset_0x017B96
                dc.w    Offset_0x017CAF-Offset_0x017B96
                dc.w    Offset_0x017CB2-Offset_0x017B96
                dc.w    Offset_0x017CB5-Offset_0x017B96
                dc.w    Offset_0x017CB8-Offset_0x017B96
                dc.w    Offset_0x017CBC-Offset_0x017B96
                dc.w    Offset_0x017CC0-Offset_0x017B96
                dc.w    Offset_0x017CCA-Offset_0x017B96
                dc.w    Offset_0x017CD4-Offset_0x017B96
                dc.w    Offset_0x017CDE-Offset_0x017B96
Offset_0x017BD8:
                dc.b    $FF, $10, $11, $12, $13, $14, $15, $0E, $0F, $FF
Offset_0x017BE2:
                dc.b    $FF, $2E, $2F, $30, $31, $FF, $FF, $FF, $FF, $FF
Offset_0x017BEC:
                dc.b    $01, $48, $47, $46, $FF
Offset_0x017BF1:
                dc.b    $01, $48, $47, $46, $FF
Offset_0x017BF6:
                dc.b    $FD, $63, $64, $65, $66, $FF, $FF, $FF, $FF, $FF
Offset_0x017C00:
                dc.b    $07, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $03, $02, $01, $01, $01
                dc.b    $01, $01, $01, $01, $01, $03, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01
                dc.b    $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
                dc.b    $06, $07, $08, $07, $08, $07, $08, $07, $08, $07, $08, $06, $FE, $1C
Offset_0x017C3E:
                dc.b    $09, $69, $69, $6A, $6A, $69, $69, $6A, $6A, $69, $69, $6A, $6A, $69, $69, $6A
                dc.b    $6A, $69, $69, $6A, $6A, $69, $6A, $FF
Offset_0x017C56:
                dc.b    $3F, $04, $FF
Offset_0x017C59:
                dc.b    $3F, $5B, $FF
Offset_0x017C5C:
                dc.b    $00, $60, $61, $62, $FF
Offset_0x017C61:
                dc.b    $3F, $82, $FF
Offset_0x017C64:
                dc.b    $07, $08, $08, $09, $FD, $05
Offset_0x017C6A:
                dc.b    $07, $09, $FD, $05
Offset_0x017C6E:
                dc.b    $07, $67, $68, $67, $68, $FD, $00
Offset_0x017C75:
                dc.b    $09, $6E, $73, $FF
Offset_0x017C79:
                dc.b    $09, $6E, $6F, $70, $71, $72, $FF
Offset_0x017C80:
                dc.b    $03, $59, $5A, $59, $5A, $59, $5A, $59, $5A, $59, $5A, $59, $5A, $FD, $00
Offset_0x017C8F:
                dc.b    $05, $6C, $6D, $FF
Offset_0x017C93:
                dc.b    $0F, $01, $02, $03, $FE, $01
Offset_0x017C99:
                dc.b    $0F, $01, $02, $FE, $01
Offset_0x017C9E:
                dc.b    $13, $85, $86, $FF
Offset_0x017CA2:
                dc.b    $0B, $74, $74, $12, $13, $FD, $00
Offset_0x017CA9:
                dc.b    $20, $5D, $FF
Offset_0x017CAC:
                dc.b    $2F, $5D, $FF
Offset_0x017CAF:
                dc.b    $03, $5D, $FF
Offset_0x017CB2:
                dc.b    $03, $5D, $FF
Offset_0x017CB5:
                dc.b    $03, $5C, $FF
Offset_0x017CB8:
                dc.b    $09, $6B, $5C, $FF
Offset_0x017CBC:
                dc.b    $77, $00, $FD, $00
Offset_0x017CC0:
                dc.b    $03, $01, $02, $03, $04, $05, $06, $07, $08, $FF
Offset_0x017CCA:
                dc.b    $03, $01, $02, $03, $04, $05, $06, $07, $08, $FF
Offset_0x017CD4:
                dc.b    $FF, $32, $33, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Offset_0x017CDE:
                dc.b    $01, $5E, $5F, $FF    
;-------------------------------------------------------------------------------
Load_Miles_Tail_Dynamic_PLC:                                   ; Offset_0x017CE2
                moveq   #$00, D0
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                cmp.b   ($FFFFF7DF).w, D0
                beq.s   Exit_Load_Miles_Dynamic_PLC            ; Offset_0x017D5C
                move.b  D0, ($FFFFF7DF).w
                lea     (Miles_Dyn_Script), A2                 ; Offset_0x07446C
                add.w   D0, D0
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D5
                subq.w  #$01, D5
                bmi.s   Exit_Load_Miles_Dynamic_PLC            ; Offset_0x017D5C
                move.w  #$F600, D4
                bra.s   Load_Miles_Dynamic_PLC_Loop            ; Offset_0x017D30
;-------------------------------------------------------------------------------                
Load_Miles_Dynamic_PLC:                                        ; Offset_0x017D0A
                moveq   #$00, D0
                move.b  Obj_Map_Id(A0), D0                               ; $001A
Load_Miles_Dynamic_PLC_D0:                                     ; Offset_0x017D10                
                cmp.b   ($FFFFF7DE).w, D0
                beq.s   Exit_Load_Miles_Dynamic_PLC            ; Offset_0x017D5C
                move.b  D0, ($FFFFF7DE).w
                lea     (Miles_Dyn_Script), A2                 ; Offset_0x07446C
                add.w   D0, D0
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D5
                subq.w  #$01, D5
                bmi.s   Exit_Load_Miles_Dynamic_PLC            ; Offset_0x017D5C
                move.w  #$F400, D4
Load_Miles_Dynamic_PLC_Loop:                                   ; Offset_0x017D30
                moveq   #$00, D1
                move.w  (A2)+, D1
                move.w  D1, D3
                lsr.w   #$08, D3
                andi.w  #$00F0, D3
                addi.w  #$0010, D3
                andi.w  #$0FFF, D1
                lsl.l   #$05, D1
                addi.l  #Art_Miles, D1                         ; Offset_0x064320
                move.w  D4, D2
                add.w   D3, D4
                add.w   D3, D4
                jsr     (DMA_68KtoVRAM)                        ; Offset_0x0019E4
                dbra    D5, Load_Miles_Dynamic_PLC_Loop        ; Offset_0x017D30
Exit_Load_Miles_Dynamic_PLC:                                   ; Offset_0x017D5C
                rts                                                                                                                                                                                             
;===============================================================================
; Objeto 0x02 - Miles
; <<<- 
;===============================================================================