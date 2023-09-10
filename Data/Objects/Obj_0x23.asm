;===============================================================================
; Objeto 0x23 - Pilar que solta a parte debaixo na Neo Green Hill
; ->>>        
;===============================================================================     
; Offset_0x020294:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0202A2(PC, D0), D1
                jmp     Offset_0x0202A2(PC, D1)
;-------------------------------------------------------------------------------   
Offset_0x0202A2:
                dc.w    Offset_0x0202A6-Offset_0x0202A2
                dc.w    Offset_0x02032A-Offset_0x0202A2        
;-------------------------------------------------------------------------------    
Offset_0x0202A6:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Pillar_Mappings, Obj_Map(A0)   ; Offset_0x0203EE, $0004
                move.w  #$2000, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_11_To_ModifySpriteAttr_2P          ; Offset_0x020AF4
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$20, Obj_Height_2(A0)                           ; $0016
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                bsr     Jmp_07_To_SingleObjectLoad_2           ; Offset_0x020AEE
                bne.s   Offset_0x02032A
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                addq.b  #$02, Obj_Routine(A1)                            ; $0024
                addq.b  #$02, Obj_Routine_2(A1)                          ; $0025
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_X(A0), Obj_Control_Var_04(A1)         ; $0008, $0030
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$0030, Obj_Y(A1)                                ; $000C
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  #$10, Obj_Height_2(A1)                           ; $0016
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.b  #$01, Obj_Map_Id(A1)                             ; $001A  
;-------------------------------------------------------------------------------    
Offset_0x02032A:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Offset_0x020350
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  Obj_Height_2(A0), D2                             ; $0016
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  (A7)+, D4
                bsr     Jmp_05_To_SolidObject                  ; Offset_0x020AFA
                bra     Jmp_0E_To_MarkObjGone                  ; Offset_0x020AE8
Offset_0x020350:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02035E(PC, D0), D1
                jmp     Offset_0x02035E(PC, D1)     
;-------------------------------------------------------------------------------    
Offset_0x02035E:
                dc.w    Offset_0x020394-Offset_0x02035E
                dc.w    Offset_0x020366-Offset_0x02035E
                dc.w    Offset_0x020396-Offset_0x02035E
                dc.w    Offset_0x0203C0-Offset_0x02035E     
;-------------------------------------------------------------------------------   
Offset_0x020366:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne.s   Offset_0x020394
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x020376
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
Offset_0x020376:
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_X(A1), D0                                    ; $0008
                bcc.s   Offset_0x020382
                neg.w   D0
Offset_0x020382:
                cmpi.w  #$0080, D0
                bcc.s   Offset_0x020394
                move.b  #$04, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0008, Obj_Control_Var_08(A0)                   ; $0034
Offset_0x020394:
                rts     
;-------------------------------------------------------------------------------  
Offset_0x020396:
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                subq.w  #$01, D0
                bcc.s   Offset_0x0203A4
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                rts
Offset_0x0203A4:
                move.w  D0, Obj_Control_Var_08(A0)                       ; $0034
                move.b  Offset_0x0203B8(PC, D0), D0
                ext.w   D0
                add.w   Obj_Control_Var_04(A0), D0                       ; $0030
                move.w  D0, Obj_X(A0)                                    ; $0008
                rts   
;-------------------------------------------------------------------------------                                                    
Offset_0x0203B8:
                dc.b    $00, $01, $FF, $01, $00, $FF, $00, $01  
;-------------------------------------------------------------------------------    
Offset_0x0203C0:
                bsr     Jmp_0A_To_SpeedToPos                   ; Offset_0x020B00
                addi.w  #$0038, Obj_Speed_Y(A0)                          ; $0012
                bsr     ObjHitFloor                            ; Offset_0x019B74
                tst.w   D1
                bpl     Offset_0x0203EC
                add.w   D1, Obj_Y(A0)                                    ; $000C
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                move.w  Obj_Y(A0), Obj_Control_Var_06(A0)         ; $000C, $0032
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
                clr.b   Obj_Routine_2(A0)                                ; $0025
Offset_0x0203EC:
                rts        
;------------------------------------------------------------------------------- 
Pillar_Mappings:                                               ; Offset_0x0203EE
                dc.w    Offset_0x0203F4-Pillar_Mappings
                dc.w    Offset_0x020426-Pillar_Mappings
                dc.w    Offset_0x020440-Pillar_Mappings
Offset_0x0203F4:
                dc.w    $0006
                dc.l    $E005005D, $002EFFE0
                dc.l    $E005085D, $082E0010
                dc.l    $E00D0061, $0030FFF0
                dc.l    $F00D0069, $0034FFF0
                dc.l    $000D0069, $0034FFF0
                dc.l    $100D0071, $0038FFF0
Offset_0x020426:
                dc.w    $0003
                dc.l    $F00D0069, $0034FFF0
                dc.l    $000D0079, $003CFFF0
                dc.l    $10040081, $0040FFF0
Offset_0x020440:
                dc.w    $0004
                dc.l    $090D208B, $2045FFF0
                dc.l    $F00D0069, $0034FFF0
                dc.l    $000D0079, $003CFFF0
                dc.l    $10040081, $0040FFF0          
;===============================================================================   
; Objeto 0x23 - Pilar que solta a parte debaixo na Neo Green Hill
; <<<-        
;===============================================================================