;===============================================================================
; Objeto 0xC6 - Robotnik correndo após o Metal Sonic ser derrotado na Death Egg
; ->>>          
;===============================================================================  
Offset_0x03689C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0368AA(PC, D0), D1
                jmp     Offset_0x0368AA(PC, D1)   
;-------------------------------------------------------------------------------  
Offset_0x0368AA:
                dc.w    Offset_0x0368B2-Offset_0x0368AA
                dc.w    Offset_0x0368C4-Offset_0x0368AA
                dc.w    Offset_0x0369F8-Offset_0x0368AA
                dc.w    Offset_0x036A58-Offset_0x0368AA    
;-------------------------------------------------------------------------------  
Offset_0x0368B2:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  Obj_Subtype(A0), D0                              ; $0028
                subi.b  #$94, D0
                move.b  D0, Obj_Routine(A0)                              ; $0024   
;-------------------------------------------------------------------------------  
                rts
Offset_0x0368C4:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x0368D6(PC, D0), D1
                jsr     Offset_0x0368D6(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6 
;-------------------------------------------------------------------------------
Offset_0x0368D6:
                dc.w    Offset_0x0368E0-Offset_0x0368D6
                dc.w    Offset_0x036906-Offset_0x0368D6
                dc.w    Offset_0x036928-Offset_0x0368D6
                dc.w    Offset_0x036948-Offset_0x0368D6
                dc.w    Offset_0x0369BC-Offset_0x0368D6     
;-------------------------------------------------------------------------------
Offset_0x0368E0:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                lea     (Load_Sub_Obj_0xC6), A2                ; Offset_0x036AA0
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                move.b  #$98, Obj_Subtype(A1)                            ; $0028
                move.w  #$03F8, Obj_X(A1)                                ; $0008
                move.w  #$0160, Obj_Y(A1)                                ; $000C
                move.w  A0, ($FFFFF660).w
                rts   
;-------------------------------------------------------------------------------
Offset_0x036906:
                bsr     Offset_0x030B18
                addi.w  #$005C, D2
                cmpi.w  #$00B8, D2
                bcs.s   Offset_0x036916
                rts
Offset_0x036916:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0018, Obj_Timer(A0)                            ; $002A
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                rts   
;-------------------------------------------------------------------------------
Offset_0x036928:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x036930
                rts
Offset_0x036930:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bset    #$02, Obj_Status(A0)                             ; $0022
                move.w  #$0200, Obj_Speed(A0)                            ; $0010
                move.w  #$0010, Obj_Timer(A0)                            ; $002A
                rts  
;-------------------------------------------------------------------------------
Offset_0x036948:
                cmpi.w  #$0790, Obj_X(A0)                                ; $0008
                bcc.s   Offset_0x036988
                bsr     Offset_0x030B18
                addi.w  #$0050, D2
                cmpi.w  #$00A0, D2
                bcc.s   Offset_0x03696A
                move.w  Obj_X(A1), D0                                    ; $0008
                addi.w  #$0050, D0
                move.w  D0, Obj_X(A0)                                    ; $0008
Offset_0x03696A:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bpl.s   Offset_0x03697A
                move.w  #$0020, Obj_Timer(A0)                            ; $002A
                bsr     Offset_0x0369CE
Offset_0x03697A:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Robotnik_Running_Animate_Data), A1    ; Offset_0x036AA8
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
Offset_0x036988:
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
                clr.w   Obj_Speed(A0)                                    ; $0010
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x0369BA
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0080, Obj_Speed(A0)                            ; $0010
                move.w  #$FE00, Obj_Speed_Y(A0)                          ; $0012
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
                move.w  #$0040, Obj_Timer(A0)                            ; $002A
                bset    #$03, Obj_Status(A0)                             ; $0022
Offset_0x0369BA:
                rts  
;-------------------------------------------------------------------------------
Offset_0x0369BC:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                addi.w  #$0010, Obj_Speed_Y(A0)                          ; $0012
                bra     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
Offset_0x0369CE:
                lea     (Load_Sub_Obj_0xC6_1), A2              ; Offset_0x036AA4
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                move.b  #$9A, Obj_Subtype(A1)                            ; $0028
                move.b  #$05, Obj_Map_Id(A1)                             ; $001A
                move.w  #$FF00, Obj_Speed(A1)                            ; $0010
                subi.w  #$0018, Obj_Y(A1)                                ; $000C
                move.w  #$0008, Obj_Timer(A1)                            ; $002A
                rts     
;-------------------------------------------------------------------------------  
Offset_0x0369F8:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036A0A(PC, D0), D1
                jsr     Offset_0x036A0A(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;-------------------------------------------------------------------------------
Offset_0x036A0A:
                dc.w    Offset_0x036A10-Offset_0x036A0A
                dc.w    Offset_0x036A26-Offset_0x036A0A
                dc.w    Offset_0x036A34-Offset_0x036A0A    
;-------------------------------------------------------------------------------
Offset_0x036A10:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                btst    #$02, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x036A20
                bra     Offset_0x036A42
Offset_0x036A20:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                rts       
;-------------------------------------------------------------------------------
Offset_0x036A26:
                bsr     Offset_0x036A42
                lea     (Robotnik_Running_Animate_Data_01), A1 ; Offset_0x036AB0
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620    
;-------------------------------------------------------------------------------
Offset_0x036A34:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bclr    #$05, Obj_Status(A1)                             ; $0022
                bra     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
Offset_0x036A42:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                move.w  #$0013, D1
                move.w  #$0020, D2
                move.w  #$0020, D3
                move.w  (A7)+, D4
                bra     Jmp_19_To_SolidObject                  ; Offset_0x03764A  
;-------------------------------------------------------------------------------
Offset_0x036A58:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036A6A(PC, D0), D1
                jsr     Offset_0x036A6A(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;-------------------------------------------------------------------------------
Offset_0x036A6A:
                dc.w    Offset_0x036A6C-Offset_0x036A6A   
;-------------------------------------------------------------------------------
Offset_0x036A6C:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                addi.w  #$0010, Obj_Speed_Y(A0)                          ; $0012
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608  
;-------------------------------------------------------------------------------
Obj_0xC6_Ptr:                                                  ; Offset_0x036A82
                dc.l    Robotnik_Running_Mappings              ; Offset_0x036AB8
                dc.w    $0000
                dc.b    $04, $05, $18, $00            
;-------------------------------------------------------------------------------
Obj_0xC6_01_Ptr:                                               ; Offset_0x036A8C
                dc.l    Robotnik_Running_Automatic_Door_Map    ; Offset_0x036B70
                dc.w    $2328
                dc.b    $04, $01, $08, $00
;-------------------------------------------------------------------------------
Obj_0xC6_02_Ptr:                                               ; Offset_0x036A96
                dc.l    Robotnik_Running_Mappings              ; Offset_0x036AB8
                dc.w    $0000
                dc.b    $04, $05, $04, $00           
;-------------------------------------------------------------------------------  
Load_Sub_Obj_0xC6:                                             ; Offset_0x036AA0        
                dc.w    $003E
                dc.b    $C6, $98   
;------------------------------------------------------------------------------- 
Load_Sub_Obj_0xC6_1:                                           ; Offset_0x036AA4
                dc.w    $003C
                dc.b    $C6, $9A     
;-------------------------------------------------------------------------------
Robotnik_Running_Animate_Data:                                 ; Offset_0x036AA8
                dc.w    Offset_0x036AAA-Robotnik_Running_Animate_Data
Offset_0x036AAA:
                dc.b    $05, $02, $03, $04, $FF, $00      
;-------------------------------------------------------------------------------  
Robotnik_Running_Animate_Data_01:                              ; Offset_0x036AB0
                dc.w    Offset_0x036AB2-Robotnik_Running_Animate_Data_01
Offset_0x036AB2:
                dc.b    $01, $00, $01, $02
                dc.b    $03, $FA            
;-------------------------------------------------------------------------------   
Robotnik_Running_Mappings:                                     ; Offset_0x036AB8
                dc.w    Offset_0x036AC4-Robotnik_Running_Mappings
                dc.w    Offset_0x036ADE-Robotnik_Running_Mappings
                dc.w    Offset_0x036AF8-Robotnik_Running_Mappings
                dc.w    Offset_0x036B22-Robotnik_Running_Mappings
                dc.w    Offset_0x036B44-Robotnik_Running_Mappings
                dc.w    Offset_0x036B66-Robotnik_Running_Mappings
Offset_0x036AC4:
                dc.w    $0003
                dc.l    $E60D0500, $0280FFF0
                dc.l    $F60E0564, $02B2FFF0
                dc.l    $0E0D0570, $02B8FFF0
Offset_0x036ADE:
                dc.w    $0003
                dc.l    $E60D0510, $0288FFF0
                dc.l    $F60E0564, $02B2FFF0
                dc.l    $0E0D0570, $02B8FFF0
Offset_0x036AF8:
                dc.w    $0005
                dc.l    $EC040518, $028CFFE0
                dc.l    $E40D051A, $028DFFF0
                dc.l    $F40E0522, $0291FFF0
                dc.l    $0401052E, $0297FFE8
                dc.l    $04050530, $02980010
Offset_0x036B22:
                dc.w    $0004
                dc.l    $EC040518, $028CFFE0
                dc.l    $E40D051A, $028DFFF0
                dc.l    $F40E0534, $029AFFF0
                dc.l    $0C050540, $02A0FFF8
Offset_0x036B44:
                dc.w    $0004
                dc.l    $EC040518, $028CFFE0
                dc.l    $E40E0544, $02A2FFF0
                dc.l    $FC0F0550, $02A8FFF0
                dc.l    $0C010560, $02B00010
Offset_0x036B66:
                dc.w    $0001
                dc.l    $FC040562, $02B1FFF8           
;-------------------------------------------------------------------------------  
Robotnik_Running_Automatic_Door_Map:                           ; Offset_0x036B70
                dc.w    Offset_0x036B78-Robotnik_Running_Automatic_Door_Map
                dc.w    Offset_0x036B9A-Robotnik_Running_Automatic_Door_Map
                dc.w    Offset_0x036BB4-Robotnik_Running_Automatic_Door_Map
                dc.w    Offset_0x036BC6-Robotnik_Running_Automatic_Door_Map
Offset_0x036B78:
                dc.w    $0004
                dc.l    $E0050000, $0000FFF8
                dc.l    $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8
                dc.l    $10050000, $0000FFF8
Offset_0x036B9A:
                dc.w    $0003
                dc.l    $E0050000, $0000FFF8
                dc.l    $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8
Offset_0x036BB4:
                dc.w    $0002
                dc.l    $E0050000, $0000FFF8
                dc.l    $F0050000, $0000FFF8
Offset_0x036BC6:
                dc.w    $0001
                dc.l    $E0050000, $0000FFF8                  
;===============================================================================   
; Objeto 0xC6 - Robotnik correndo após o Metal Sonic ser derrotado na Death Egg
; <<<-
;===============================================================================