;===============================================================================
; Objeto 0xD6 -> Acionadores dos caça níqueis e pontos extras na Casino Night
; ->>> 
;===============================================================================
; Offset_0x026644:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x026652(PC, D0), D1
                jmp     Offset_0x026652(PC, D1)      
;-------------------------------------------------------------------------------
Offset_0x026652:
                dc.w    Offset_0x026656-Offset_0x026652
                dc.w    Offset_0x02667E-Offset_0x026652       
;-------------------------------------------------------------------------------
Offset_0x026656:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Slot_Machine_Starter_Mappings, Obj_Map(A0) ; Offset_0x0267A8, $0004
                move.w  #$0388, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_30_To_ModifySpriteAttr_2P          ; Offset_0x026F2A
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$18, Obj_Width(A0)                              ; $0019
                move.b  #$01, Obj_Priority(A0)                           ; $0018  
;-------------------------------------------------------------------------------
Offset_0x02667E:
                move.w  #$0023, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     Obj_Control_Var_04(A0), A2                       ; $0030
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     Offset_0x0266C0
                movem.l (A7)+, D1-D4
                lea     Obj_Control_Var_08(A0), A2                       ; $0034
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$04, D6
                bsr     Offset_0x0266C0
                lea     (Slot_Machine_Starter_Animate_Data), A1 ; Offset_0x02679C
                bsr     Jmp_07_To_AnimateSprite                ; Offset_0x026F24
                bra     Jmp_1B_To_MarkObjGone                  ; Offset_0x026F1E
Offset_0x0266C0:
                move.w  (A2), D0
                move.w  Offset_0x0266CA(PC, D0), D0
                jmp     Offset_0x0266CA(PC, D0)       
;-------------------------------------------------------------------------------
Offset_0x0266CA:
                dc.w    Offset_0x0266D0-Offset_0x0266CA
                dc.w    Offset_0x026730-Offset_0x0266CA
                dc.w    Offset_0x026792-Offset_0x0266CA           
;-------------------------------------------------------------------------------
Offset_0x0266D0:
                bsr     Jmp_06_To_SolidObject_2_A1             ; Offset_0x026F30
                tst.w   D4
                bpl.s   Offset_0x02672E
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
                move.w  #$0000, Obj_Inertia(A1)                          ; $0014
                move.b  #$81, Obj_Timer(A1)                              ; $002A
                bset    #$02, Obj_Status(A1)                             ; $0022
                move.b  #$0E, Obj_Height_2(A1)                           ; $0016
                move.b  #$07, Obj_Width_2(A1)                            ; $0017
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                addq.w  #$02, (A2)+
                move.w  #$0078, (A2)
                cmpi.b  #$38, ($FFFFFF4E).w
                bne.s   Offset_0x02672E
                move.b  #$08, ($FFFFFF4E).w
Offset_0x02672E:
                rts                                        
;-------------------------------------------------------------------------------
Offset_0x026730:
                subq.w  #$01, Obj_Art_VRAM(A2)                           ; $0002
                bpl.s   Offset_0x026760
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$00, Obj_Timer(A1)                              ; $002A
                bclr    D6, Obj_Status(A0)                               ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                bset    #$01, Obj_Status(A1)                             ; $0022
                move.w  #$0400, Obj_Speed_Y(A1)                          ; $0012
                addq.w  #$02, (A2)+
                move.w  #$003C, (A2)
                rts
Offset_0x026760:
                move.w  Obj_Art_VRAM(A2), D0                             ; $0002
                andi.w  #$0007, D0
                bne.s   Offset_0x026790
                moveq   #$0A, D0
                jsr     (AddPoints)                            ; Offset_0x0394D0
                bsr     Jmp_07_To_SingleObjectLoad             ; Offset_0x026F18
                bne.s   Offset_0x026790
                move.b  #$29, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$00, Obj_Map_Id(A1)                             ; $001A
Offset_0x026790:
                rts                            
;-------------------------------------------------------------------------------
Offset_0x026792:
                subq.w  #$01, Obj_Art_VRAM(A2)                           ; $0002
                bpl.s   Offset_0x02679A
                clr.w   (A2)
Offset_0x02679A:
                rts                    
;-------------------------------------------------------------------------------  
Slot_Machine_Starter_Animate_Data:                             ; Offset_0x02679C
                dc.w    Offset_0x0267A0-Slot_Machine_Starter_Animate_Data
                dc.w    Offset_0x0267A3-Slot_Machine_Starter_Animate_Data
Offset_0x0267A0:
                dc.b    $0F, $00, $FF
Offset_0x0267A3:
                dc.b    $01, $01, $00, $FF, $00                  
;-------------------------------------------------------------------------------
Slot_Machine_Starter_Mappings:                                 ; Offset_0x0267A8
                dc.w    Offset_0x0267AC-Slot_Machine_Starter_Mappings
                dc.w    Offset_0x0267DE-Slot_Machine_Starter_Mappings
Offset_0x0267AC:
                dc.w    $0006
                dc.l    $EC090000, $0000FFE8
                dc.l    $EC090800, $08000000
                dc.l    $FC090000, $0000FFE8
                dc.l    $FC090800, $08000000
                dc.l    $0C090000, $0000FFE8
                dc.l    $0C090800, $08000000
Offset_0x0267DE:
                dc.w    $0006
                dc.l    $EC092006, $2003FFE8
                dc.l    $EC092806, $28030000
                dc.l    $FC092006, $2003FFE8
                dc.l    $FC092806, $28030000
                dc.l    $0C092006, $2003FFE8
                dc.l    $0C092806, $28030000
;===============================================================================
; Objeto 0xD6 -> Acionadores dos caça níqueis e pontos extras na Casino Night
; <<<- 
;===============================================================================