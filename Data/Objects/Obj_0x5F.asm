;===============================================================================
; Objeto 0x5F - Palavra "START" com bandeiras e semáforo no início do 
; ->>>          Special Stage
;===============================================================================  
; Offset_0x0090E8:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0090F6(PC, D0), D1
                jmp     Offset_0x0090F6(PC, D1)
;-------------------------------------------------------------------------------    
Offset_0x0090F6:
                dc.w    Offset_0x009170-Offset_0x0090F6
                dc.w    Offset_0x0091A2-Offset_0x0090F6
                dc.w    Offset_0x0091CA-Offset_0x0090F6
                dc.w    Offset_0x009102-Offset_0x0090F6
                dc.w    Set_Traffic_Lights-Offset_0x0090F6     ; Offset_0x00924C
                dc.w    Offset_0x00923A-Offset_0x0090F6
;-------------------------------------------------------------------------------     
Offset_0x009102:
                tst.w   Obj_Speed(A0)                                    ; $0010
                beq.s   Offset_0x009136
                bmi.s   Offset_0x009120
                addi.w  #$0040, Obj_Speed(A0)                            ; $0010
                cmpi.w  #$0800, Obj_Speed(A0)                            ; $0010
                ble.s   Offset_0x00914A
                move.w  #$0800, Obj_Speed(A0)                            ; $0010
                bra.s   Offset_0x00914A
Offset_0x009120:
                subi.w  #$0040, Obj_Speed(A0)                            ; $0010
                cmpi.w  #$F800, Obj_Speed(A0)                            ; $0010
                bge.s   Offset_0x00914A
                move.w  #$F800, Obj_Speed(A0)                            ; $0010
                bra.s   Offset_0x00914A
Offset_0x009136:
                addi.w  #$0040, Obj_Speed_Y(A0)                          ; $0012
                cmpi.w  #$0800, Obj_Speed_Y(A0)                          ; $0012
                blt.s   Offset_0x00914A
                move.w  #$0800, Obj_Speed_Y(A0)                          ; $0012
Offset_0x00914A:
                bsr     Jmp_00_To_SpeedToPos                   ; Offset_0x0096A0
                cmpi.w  #$FFE8, Obj_X(A0)                                ; $0008
                blt     Jmp_00_To_DeleteObject                 ; Offset_0x00969A
                cmpi.w  #$0118, Obj_X(A0)                                ; $0008
                bgt     Jmp_00_To_DeleteObject                 ; Offset_0x00969A
                cmpi.w  #$0100, Obj_Y(A0)                                ; $000C
                bgt     Jmp_00_To_DeleteObject                 ; Offset_0x00969A
                bra     Jmp_00_To_DisplaySprite                ; Offset_0x009694
;-------------------------------------------------------------------------------                  
Offset_0x009170:
                move.w  #$0080, Obj_X(A0)                                ; $0008
                move.w  #$FFC0, Obj_Y(A0)                                ; $000C
                move.w  #$0100, Obj_Speed_Y(A0)                          ; $0012
                move.l  #Flags_START_Traffic_Lights_Mappings, Obj_Map(A0) ; Offset_0x0092EE, $0004
                move.w  #$030D, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$02, Obj_Routine(A0)                            ; $0024
;-------------------------------------------------------------------------------                  
Offset_0x0091A2:
                bsr     Jmp_00_To_SpeedToPos                   ; Offset_0x0096A0
                cmpi.w  #$0048, Obj_Y(A0)                                ; $000C
                blt     Jmp_00_To_DisplaySprite                ; Offset_0x009694
                bsr     Offset_0x0092A2
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$0048, Obj_Y(A0)                                ; $000C
                move.b  #$04, Obj_Routine(A0)                            ; $0024
                bra     Jmp_00_To_DisplaySprite                ; Offset_0x009694
;-------------------------------------------------------------------------------                  
Offset_0x0091CA:
                tst.b   Obj_Timer(A0)                                    ; $002A
                bne.s   Offset_0x0091E4
                bra     Jmp_00_To_DisplaySprite                ; Offset_0x009694     
;-------------------------------------------------------------------------------    
Offset_0x0091D4:
                dc.w    $02A0, $03C0, $04E0, $0500, $0620, $0740, $0860, $0960
;-------------------------------------------------------------------------------                
Offset_0x0091E4:
                moveq   #$07, D6
                lea     Offset_0x0091D4(PC), A2
Offset_0x0091EA:
                bsr     Offset_0x009064
                bne.s   Offset_0x00922C
                moveq   #$00, D0
                move.w  #$000F, D1
Offset_0x0091F6:
                move.l  $00(A0, D0), $00(A1, D0)
                addq.w  #$04, D0
                dbra    D1, Offset_0x0091F6
                move.b  #$06, Obj_Routine(A1)                            ; $0024
                move.b  (A2)+, Obj_Map_Id(A1)                            ; $001A
                move.b  (A2)+, D3
                ext.w   D3
                asl.w   #$04, D3
                move.w  D3, Obj_Speed(A1)                                ; $0010
                cmpi.w  #$0004, D6
                bne.s   Offset_0x009228
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
                move.w  #$0600, Obj_Speed_Y(A1)                          ; $0012
Offset_0x009228:
                dbra    D6, Offset_0x0091EA
Offset_0x00922C:
                move.b  #$0A, Obj_Routine(A0)                            ; $0024
                move.w  #$001E, Obj_Timer(A0)                            ; $002A
                rts
;-------------------------------------------------------------------------------                
Offset_0x00923A:
                subi.w  #$0001, Obj_Timer(A0)                            ; $002A
                bpl.s   Offset_0x00924A
                st      ($FFFF9B23).w
                bra     Jmp_00_To_DeleteObject                 ; Offset_0x00969A
Offset_0x00924A:
                rts
;-------------------------------------------------------------------------------                
Set_Traffic_Lights:                                            ; Offset_0x00924C
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bpl.s   Offset_0x009282
                move.w  #$003C, Obj_Timer(A0)                            ; $002A
                subi.w  #$0001, Obj_Control_Var_00(A0)                   ; $002C
                beq.s   Offset_0x009286
                move.w  Obj_Control_Var_00(A0), D0                       ; $002C
                subq.w  #$01, D0
                lsl.w   #$03, D0
                lea     Traffic_Lights_Pal(PC), A2             ; Offset_0x009292
                adda.w  D0, A2
                adda.w  #$0002, A2
                lea     ($FFFFFB76).w, A3
                move.w  (A2)+, (A3)+
                move.w  (A2)+, (A3)+
                move.w  (A2)+, (A3)+
                addi.w  #$0010, Obj_Y(A0)                                ; $000C
Offset_0x009282:
                bra     Jmp_00_To_DisplaySprite                ; Offset_0x009694
Offset_0x009286:
                move.l  Obj_Control_Var_02(A0), A1                       ; $002E
                st      Obj_Timer(A1)                                    ; $002A
                bra     Jmp_00_To_DeleteObject                 ; Offset_0x00969A   
;-------------------------------------------------------------------------------   
Traffic_Lights_Pal:                                            ; Offset_0x009292
                dc.w    $0EEE, $00EA, $00C6, $0082  ; Luz Verde  
                dc.w    $0EEE, $0AEE, $00CE, $008A  ; Luz Amarela
;-------------------------------------------------------------------------------  
Offset_0x0092A2:
                bsr     Offset_0x009064
                bne.s   Offset_0x0092EC
                move.w  #$00E0, Obj_X(A1)                                ; $0008
                move.w  #$0048, Obj_Y(A1)                                ; $000C
                move.b  (A0), (A1)
                move.l  #Flags_START_Traffic_Lights_Mappings, Obj_Map(A1) ; Offset_0x0092EE, $0004
                move.w  #$630D, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$00, Obj_Priority(A1)                           ; $0018
                move.b  #$08, Obj_Routine(A1)                            ; $0024
                move.w  #$003C, Obj_Timer(A1)                            ; $002A
                move.w  #$0003, Obj_Control_Var_00(A1)                   ; $002C
                move.b  #$01, Obj_Map_Id(A1)                             ; $001A
                move.l  A0, Obj_Control_Var_02(A1)                       ; $002E
Offset_0x0092EC:
                rts   
;-------------------------------------------------------------------------------  
Flags_START_Traffic_Lights_Mappings:                           ; Offset_0x0092EE
                dc.w    Flags_START_Traffic_Lights_Map-Flags_START_Traffic_Lights_Mappings ; Offset_0x009302
                dc.w    Traffic_Lights_Light_Map-Flags_START_Traffic_Lights_Mappings ; Offset_0x009354
                dc.w    Left_Flag_Map-Flags_START_Traffic_Lights_Mappings ; Offset_0x00935E
                dc.w    S_Map-Flags_START_Traffic_Lights_Mappings         ; Offset_0x009368
                dc.w    Left_T_Map-Flags_START_Traffic_Lights_Mappings    ; Offset_0x009372
                dc.w    A_Map-Flags_START_Traffic_Lights_Mappings         ; Offset_0x00937C
                dc.w    R_Map-Flags_START_Traffic_Lights_Mappings         ; Offset_0x009386
                dc.w    Right_T_Map-Flags_START_Traffic_Lights_Mappings   ; Offset_0x009390
                dc.w    Right_Flag_Map-Flags_START_Traffic_Lights_Mappings ; Offset_0x00939A
                dc.w    Traffic_Lights_Map-Flags_START_Traffic_Lights_Mappings ; Offset_0x0093A4
Flags_START_Traffic_Lights_Map:                                ; Offset_0x009302
                dc.w    $000A
                dc.l    $000FA038, $A01CFFB8
                dc.l    $0007E000, $E000FFD8
                dc.l    $0007E008, $E004FFE8
                dc.l    $0007E010, $E008FFF8
                dc.l    $0007E018, $E00C0008
                dc.l    $0007E008, $E0040018
                dc.l    $000FA838, $A81C0028
                dc.l    $F805A048, $A0240058
                dc.l    $0805A048, $A0240058
                dc.l    $1805A048, $A0240058
Traffic_Lights_Light_Map:                                      ; Offset_0x009354
                dc.w    $0001
                dc.l    $F805804C, $8026FFF8
Left_Flag_Map:                                                 ; Offset_0x00935E
                dc.w    $0001
                dc.l    $000FA038, $A01CFFB8
S_Map:                                                         ; Offset_0x009368
                dc.w    $0001
                dc.l    $0007E000, $E000FFD8
Left_T_Map:                                                    ; Offset_0x009372
                dc.w    $0001
                dc.l    $0007E008, $E004FFE8
A_Map:                                                         ; Offset_0x00937C
                dc.w    $0001
                dc.l    $0007E010, $E008FFF8
R_Map:                                                         ; Offset_0x009386
                dc.w    $0001
                dc.l    $0007E018, $E00C0008
Right_T_Map:                                                   ; Offset_0x009390
                dc.w    $0001
                dc.l    $0007E008, $E0040018
Right_Flag_Map:                                                ; Offset_0x00939A
                dc.w    $0001
                dc.l    $000FA838, $A81C0028
Traffic_Lights_Map:                                            ; Offset_0x0093A4
                dc.w    $0003
                dc.l    $F805A048, $A0240058
                dc.l    $0805A048, $A0240058
                dc.l    $1805A048, $A0240058                                                                                                            
;===============================================================================   
; Objeto 0x5F - Palavra "START" com bandeiras e semáforo no início do 
; <<<-          Special Stage
;===============================================================================