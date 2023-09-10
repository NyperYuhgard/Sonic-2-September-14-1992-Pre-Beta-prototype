;===============================================================================
; Objeto 0x7F - Raízes usadas como interruptores para levantar as pontes na
; ->>>          Dust Hill
;===============================================================================  
; Offset_0x024514:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x024522(PC, D0), D1
                jmp     Offset_0x024522(PC, D1)                     
;-------------------------------------------------------------------------------
Offset_0x024522:
                dc.w    Offset_0x024526-Offset_0x024522
                dc.w    Offset_0x02454E-Offset_0x024522        
;------------------------------------------------------------------------------- 
Offset_0x024526:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Vines_Switch_Mappings, Obj_Map(A0) ; Offset_0x024668, $0004
                move.w  #$640E, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_24_To_ModifySpriteAttr_2P          ; Offset_0x0246A6
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018    
;------------------------------------------------------------------------------- 
Offset_0x02454E:
                lea     Obj_Control_Var_04(A0), A2                       ; $0030
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.w  (Control_Ports_Buffer_Data).w, D0            ; $FFFFF604
                bsr.s   Offset_0x02456C
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                addq.w  #$01, A2
                move.w  ($FFFFF606).w, D0
                bsr.s   Offset_0x02456C
                bra     Jmp_16_To_MarkObjGone                  ; Offset_0x0246A0
Offset_0x02456C:
                tst.b   (A2)
                beq.s   Offset_0x0245C0
                andi.b  #$70, D0
                beq     Offset_0x024666
                clr.b   Obj_Timer(A1)                                    ; $002A
                clr.b   (A2)
                move.b  #$12, Obj_Art_VRAM(A2)                           ; $0002
                andi.w  #$0F00, D0
                beq.s   Offset_0x024590
                move.b  #$3C, Obj_Art_VRAM(A2)                           ; $0002
Offset_0x024590:
                move.w  #$FD00, Obj_Speed_Y(A1)                          ; $0012
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$000F, D0
                lea     ($FFFFF7E0).w, A3
                lea     $00(A3, D0), A3
                bclr    #$00, (A3)
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                tst.w   Obj_Control_Var_04(A0)                           ; $0030
                beq.s   Offset_0x0245BC
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
Offset_0x0245BC:
                bra     Offset_0x024666
Offset_0x0245C0:
                tst.b   Obj_Art_VRAM(A2)                                 ; $0002
                beq.s   Offset_0x0245CE
                subq.b  #$01, Obj_Art_VRAM(A2)                           ; $0002
                bne     Offset_0x024666
Offset_0x0245CE:
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                addi.w  #$000C, D0
                cmpi.w  #$0018, D0
                bcc     Offset_0x024666
                move.w  Obj_Y(A1), D1                                    ; $000C
                sub.w   Obj_Y(A0), D1                                    ; $000C
                subi.w  #$0028, D1
                cmpi.w  #$0010, D1
                bcc     Offset_0x024666
                tst.b   Obj_Timer(A1)                                    ; $002A
                bmi.s   Offset_0x024666
                cmpi.b  #$06, Obj_Routine(A1)                            ; $0024
                bcc.s   Offset_0x024666
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne.s   Offset_0x024666
                clr.w   Obj_Speed(A1)                                    ; $0010
                clr.w   Obj_Speed_Y(A1)                                  ; $0012
                clr.w   Obj_Inertia(A1)                                  ; $0014
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$0030, Obj_Y(A1)                                ; $000C
                move.b  #$14, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$01, Obj_Timer(A1)                              ; $002A
                move.b  #$01, (A2)
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$000F, D0
                lea     ($FFFFF7E0).w, A3
                bset    #$00, $00(A3, D0)
                move.w  #$00CD, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                tst.w   Obj_Control_Var_04(A0)                           ; $0030
                beq.s   Offset_0x024666
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
Offset_0x024666:
                rts       
;-------------------------------------------------------------------------------
Vines_Switch_Mappings:                                         ; Offset_0x024668
                dc.w    Offset_0x02466C-Vines_Switch_Mappings
                dc.w    Offset_0x024686-Vines_Switch_Mappings
Offset_0x02466C:
                dc.w    $0003
                dc.l    $D0070000, $0000FFF8
                dc.l    $F0070000, $0000FFF8
                dc.l    $10070008, $0004FFF8
Offset_0x024686:
                dc.w    $0003
                dc.l    $D4070000, $0000FFF8
                dc.l    $F4070000, $0000FFF8
                dc.l    $14070008, $0004FFF8                                         
;===============================================================================   
; Objeto 0x7F - Raízes usadas como interruptores para levantar as pontes na
; <<<-          Dust Hill
;===============================================================================