;===============================================================================
; Objeto 0xB2 - Tornado na Sky Fortress / Sky Chase (Avião do Sonic)
; ->>> 
;===============================================================================
Offset_0x034C9C:
                bsr     Tornado_Load_Miles                     ; Offset_0x035076
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x034CAE(PC, D0), D1
                jmp     Offset_0x034CAE(PC, D1)        
;-------------------------------------------------------------------------------
Offset_0x034CAE:
                dc.w    Offset_0x034CB6-Offset_0x034CAE
                dc.w    Offset_0x034CCC-Offset_0x034CAE
                dc.w    Offset_0x034D54-Offset_0x034CAE
                dc.w    Offset_0x034DDC-Offset_0x034CAE  
;-------------------------------------------------------------------------------
Offset_0x034CB6:
                bsr     Object_Settings                        ; Offset_0x030A30
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                subi.b  #$4E, D0
                move.b  D0, Obj_Routine(A0)                              ; $0024
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
;-------------------------------------------------------------------------------                
Offset_0x034CCC:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne.s   Offset_0x034D46
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.w  Obj_Art_VRAM(A1), D0                             ; $0002
                andi.w  #$8000, D0
                move.w  Obj_Art_VRAM(A0), D1                             ; $0002
                andi.w  #$7FFF, D1
                or.w    D0, D1
                move.w  D1, Obj_Art_VRAM(A0)                             ; $0002
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Offset_0x034EC8
                move.b  Obj_Status(A0), Obj_Control_Var_02(A0)    ; $0022, $002E
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
                move.w  (A7)+, D4
                bsr     Jmp_19_To_SolidObject                  ; Offset_0x03764A
                bsr     Offset_0x034F58
                move.b  Obj_Control_Var_02(A0), D0                       ; $002E
                move.b  Obj_Status(A0), D1                               ; $0022
                andi.b  #$08, D0
                andi.b  #$08, D1
                eor.b   D0, D1
                move.b  D1, Obj_Control_Var_02(A0)                       ; $002E
                move.w  (Camera_X).w, D0                             ; $FFFFEE00
                move.w  D0, (Sonic_Level_Limits_Min_X).w             ; $FFFFEEC8
                subi.w  #$0040, D0
                move.w  D0, (Sonic_Level_Limits_Max_X).w             ; $FFFFEECA
                move.w  (Camera_X).w, D0                             ; $FFFFEE00
                move.w  D0, (Sonic_Level_Limits_Min_X).w             ; $FFFFEEC8
                subi.w  #$0040, D0
                move.w  D0, (Sonic_Level_Limits_Max_X).w             ; $FFFFEECA
Offset_0x034D46:
                lea     (Tornado_Animate_Data), A1             ; Offset_0x0350C2
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
;-------------------------------------------------------------------------------                 
Offset_0x034D54:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x034D70(PC, D0), D1
                jsr     Offset_0x034D70(PC, D1)
                lea     (Tornado_Animate_Data), A1             ; Offset_0x0350C2
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Offset_0x030D74            
;------------------------------------------------------------------------------- 
Offset_0x034D70:
                dc.w    Offset_0x034D76-Offset_0x034D70
                dc.w    Offset_0x034D88-Offset_0x034D70
                dc.w    Offset_0x034DC8-Offset_0x034D70
;-------------------------------------------------------------------------------  
Offset_0x034D76:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$00C0, Obj_Control_Var_06(A0)                   ; $0032
                move.w  #$0100, Obj_Speed(A0)                            ; $0010
                rts
;-------------------------------------------------------------------------------                  
Offset_0x034D88:
                subq.w  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bmi.s   Offset_0x034DB0
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bsr     Offset_0x030C20
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
                move.w  (A7)+, D4
                bsr     Jmp_19_To_SolidObject                  ; Offset_0x03764A
                bra     Offset_0x03500A
Offset_0x034DB0:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0001, Obj_Control_Var_06(A0)                   ; $0032
                move.w  #$0100, Obj_Speed(A0)                            ; $0010
                move.w  #$0100, Obj_Speed_Y(A0)                          ; $0012
                rts
;-------------------------------------------------------------------------------                  
Offset_0x034DC8:
                subq.w  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bne.s   Offset_0x034DD8
                move.w  #$000E, Obj_Control_Var_06(A0)                   ; $0032
                bsr     Tornado_Load_Smoke                     ; Offset_0x035052
Offset_0x034DD8:
                bra     Offset_0x034EAA
;-------------------------------------------------------------------------------                
Offset_0x034DDC:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x034DEA(PC, D0), D1
                jmp     Offset_0x034DEA(PC, D1)         
;-------------------------------------------------------------------------------
Offset_0x034DEA:
                dc.w    Offset_0x034DEE-Offset_0x034DEA
                dc.w    Offset_0x034E4A-Offset_0x034DEA
;-------------------------------------------------------------------------------   
Offset_0x034DEE:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                lea     Offset_0x034E42(PC), A2
                move.w  Obj_X(A1), D0                                    ; $0008
                move.w  Obj_Y(A1), D1                                    ; $000C
                move.w  Obj_X(A0), D2                                    ; $0008
                add.w   (A2)+, D2
                cmp.w   D2, D0
                bcs.s   Offset_0x034E1E
                add.w   (A2)+, D2
                cmp.w   D2, D0
                bcc.s   Offset_0x034E1E
                move.w  Obj_Y(A0), D3                                    ; $000C
                add.w   (A2)+, D3
                cmp.w   D3, D1
                bcs.s   Offset_0x034E1E
                add.w   (A2)+, D3
                cmp.w   D3, D1
                bcs.s   Offset_0x034E20
Offset_0x034E1E:
                rts
Offset_0x034E20:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0100, Obj_Speed(A0)                            ; $0010
                move.w  #$FF00, Obj_Speed_Y(A0)                          ; $0012
                addi.w  #$0020, Obj_X(A0)                                ; $0008
                addi.w  #$0080, Obj_Y(A0)                                ; $000C
                clr.w   Obj_Timer(A0)                                    ; $002A
                rts 
;-------------------------------------------------------------------------------  
Offset_0x034E42:
                dc.w    $FFF0, $0020, $FF80, $0100     
;------------------------------------------------------------------------------- 
Offset_0x034E4A:
                move.w  Obj_Timer(A0), D0                                ; $002A
                addq.w  #$01, D0
                move.w  D0, Obj_Timer(A0)                                ; $002A
                move.w  Obj_Control_Var_08(A0), D1                       ; $0034
                move.w  Offset_0x034E88(PC, D1), D2
                cmp.w   D2, D0
                bcs.s   Offset_0x034E72
                addq.w  #$02, D1
                move.w  D1, Obj_Control_Var_08(A0)                       ; $0034
                lea     Offset_0x034E98(PC, D1), A1
                move.b  (A1)+, Obj_Speed(A0)                             ; $0010
                move.b  (A1)+, Obj_Speed_Y(A0)                           ; $0012
Offset_0x034E72:
                bsr     Offset_0x034EAA
                bsr     Offset_0x03500A
                lea     (Tornado_Animate_Data), A1             ; Offset_0x0350C2
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608   
;-------------------------------------------------------------------------------    
Offset_0x034E88:
                dc.w    $FFFF, $01A0, $0208, $0285, $0300, $0340, $0390, $0440
;------------------------------------------------------------------------------- 
Offset_0x034E98:
                dc.b    $F0, $00, $01, $01, $00, $01, $01, $01
                dc.b    $00, $01, $00, $01, $01, $00, $00, $01
                dc.b    $00, $01
;-------------------------------------------------------------------------------  
Offset_0x034EAA:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bsr     Offset_0x030C20
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
                move.w  (A7)+, D4
                bra     Jmp_19_To_SolidObject                  ; Offset_0x03764A
Offset_0x034EC8:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                btst    #$03, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x034EE4
                bsr     Offset_0x034F14
                bsr     Offset_0x03502A
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bra     Offset_0x030C20
Offset_0x034EE4:
                tst.b   Obj_Control_Var_02(A0)                           ; $002E
                beq.s   Offset_0x034EF2
                bsr     Offset_0x030B18
                move.w  D2, Obj_Control_Var_0C(A0)                       ; $0038
Offset_0x034EF2:
                move.w  #$0001, D0
                move.w  Obj_Control_Var_0C(A0), D3                       ; $0038
                beq.s   Offset_0x034F06
                bmi.s   Offset_0x034F00
                neg.w   D0
Offset_0x034F00:
                add.w   D0, D3
                move.w  D3, Obj_Control_Var_0C(A0)                       ; $0038
Offset_0x034F06:
                move.w  Obj_X(A1), D1                                    ; $0008
                add.w   D3, D1
                move.w  D1, Obj_X(A0)                                    ; $0008
                bra     Offset_0x030C20
Offset_0x034F14:
                tst.b   Obj_Control_Var_03(A0)                           ; $002F
                bne.s   Offset_0x034F34
                tst.b   Obj_Control_Var_02(A0)                           ; $002E
                beq.s   Offset_0x034F56
                st      Obj_Control_Var_03(A0)                           ; $002F
                clr.b   Obj_Control_Var_04(A0)                           ; $0030
                move.w  #$0200, Obj_Speed_Y(A0)                          ; $0012
                move.b  #$14, Obj_Control_Var_05(A0)                     ; $0031
Offset_0x034F34:
                subq.b  #$01, Obj_Control_Var_05(A0)                     ; $0031
                bpl.s   Offset_0x034F44
                clr.b   Obj_Control_Var_03(A0)                           ; $002F
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                rts
Offset_0x034F44:
                move.w  Obj_Speed_Y(A0), D0                              ; $0012
                cmpi.w  #$FF00, D0
                ble.s   Offset_0x034F52
                addi.w  #$FFE0, D0
Offset_0x034F52:
                move.w  D0, Obj_Speed_Y(A0)                              ; $0012
Offset_0x034F56:
                rts
Offset_0x034F58:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                btst    #$03, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x034FBE
                tst.b   Obj_Control_Var_03(A0)                           ; $002F
                bne.s   Offset_0x034F90
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                move.w  (Control_Ports_Buffer_Data).w, D2            ; $FFFFF604
                move.w  #$0080, D3
                andi.w  #$0300, D2
                beq.s   Offset_0x034F90
                andi.w  #$0200, D2
                bne.s   Offset_0x034F84
                neg.w   D3
Offset_0x034F84:
                move.w  D3, Obj_Speed_Y(A0)                              ; $0012
                bsr     Offset_0x03502A
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
Offset_0x034F90:
                bsr     Offset_0x030B18
                moveq   #$10, D3
                add.w   D3, D2
                cmpi.w  #$0020, D2
                bcs.s   Offset_0x034FBC
                move.w  Obj_Inertia(A1), D2                              ; $0014
                bpl.s   Offset_0x034FA6
                neg.w   D2
Offset_0x034FA6:
                cmpi.w  #$0900, D2
                bcc.s   Offset_0x034FBC
                tst.w   D0
                beq.s   Offset_0x034FB2
                neg.w   D3
Offset_0x034FB2:
                move.w  Obj_X(A1), D1                                    ; $0008
                add.w   D3, D1
                move.w  D1, Obj_X(A0)                                    ; $0008
Offset_0x034FBC:
                rts
Offset_0x034FBE:
                tst.b   Obj_Control_Var_04(A0)                           ; $0030
                bne.s   Offset_0x034FDE
                tst.b   Obj_Control_Var_02(A0)                           ; $002E
                beq.s   Offset_0x034FBC
                st      Obj_Control_Var_04(A0)                           ; $0030
                clr.b   Obj_Control_Var_03(A0)                           ; $002F
                move.w  #$0200, Obj_Speed_Y(A0)                          ; $0012
                move.b  #$2B, Obj_Control_Var_05(A0)                     ; $0031
Offset_0x034FDE:
                subq.b  #$01, Obj_Control_Var_05(A0)                     ; $0031
                bpl.s   Offset_0x034FEE
                clr.b   Obj_Control_Var_04(A0)                           ; $0030
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                rts
Offset_0x034FEE:
                move.w  Obj_Speed_Y(A0), D0                              ; $0012
                cmpi.w  #$FF00, D0
                ble.s   Offset_0x034FFC
                addi.w  #$FFE0, D0
Offset_0x034FFC:
                move.w  D0, Obj_Speed_Y(A0)                              ; $0012
                bsr     Offset_0x03502A
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                rts
Offset_0x03500A:
                bsr     Offset_0x030B18
                moveq   #$10, D3
                add.w   D3, D2
                cmpi.w  #$0020, D2
                bcs.s   Offset_0x035028
                tst.w   D0
                beq.s   Offset_0x03501E
                neg.w   D3
Offset_0x03501E:
                move.w  Obj_X(A0), D1                                    ; $0008
                sub.w   D3, D1
                move.w  D1, Obj_X(A1)                                    ; $0008
Offset_0x035028:
                rts
Offset_0x03502A:
                move.w  (Camera_Y).w, D0                             ; $FFFFEE04
                move.w  Obj_Y(A0), D1                                    ; $000C
                move.w  Obj_Speed_Y(A0), D2                              ; $0012
                beq.s   Offset_0x035050
                bpl.s   Offset_0x035044
                addi.w  #$0034, D0
                cmp.w   D0, D1
                bcs.s   Offset_0x03504C
                rts
Offset_0x035044:
                addi.w  #$00A8, D0
                cmp.w   D0, D1
                bcs.s   Offset_0x035050
Offset_0x03504C:
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
Offset_0x035050:
                rts
;-------------------------------------------------------------------------------
Tornado_Load_Smoke:                                            ; Offset_0x035052
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x035074
                move.b  #$C4, Obj_Id(A1)                                 ; $0000
                move.b  #$88, Obj_Subtype(A1)                            ; $0028
                move.w  A0, Obj_Control_Var_00(A1)                       ; $002C
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
Offset_0x035074:
                rts
;-------------------------------------------------------------------------------
Tornado_Load_Miles:                                            ; Offset_0x035076
                subq.b  #$01, Obj_Control_Var_0B(A0)                     ; $0037
                bmi.s   Offset_0x03507E
                rts
Offset_0x03507E:
                move.b  #$08, Obj_Control_Var_0B(A0)                     ; $0037
                moveq   #$00, D0
                move.b  Obj_Control_Var_0A(A0), D0                       ; $0036
                addq.b  #$01, D0
                cmpi.w  #$0018, D0
                bcs.s   Offset_0x035094
                moveq   #$00, D0
Offset_0x035094:
                move.b  D0, Obj_Control_Var_0A(A0)                       ; $0036
                move.b  Offset_0x0350A0(PC, D0), D0
                bra     Jmp_00_Load_Miles_Dynamic_PLC_D0       ; Offset_0x037632                               
;------------------------------------------------------------------------------- 
Offset_0x0350A0:
                dc.b    $10, $10, $10, $10, $01, $02, $03, $02
                dc.b    $01, $01, $10, $10, $10, $10, $01, $02
                dc.b    $03, $02, $01, $01, $04, $04, $01, $01
;-------------------------------------------------------------------------------                 
Obj_0xB2_Ptr:                                                  ; Offset_0x0350B8
                dc.l    Tornado_Mappings                       ; Offset_0x0350CA
                dc.w    $8500
                dc.b    $04, $04, $40, $00   
;-------------------------------------------------------------------------------                  
Tornado_Animate_Data:                                          ; Offset_0x0350C2
                dc.w    Offset_0x0350C4-Tornado_Animate_Data
Offset_0x0350C4:
                dc.b    $00, $00, $01, $02, $03, $FF
;-------------------------------------------------------------------------------   
Tornado_Mappings                                               ; Offset_0x0350CA
                dc.w    Offset_0x0350D2-Tornado_Mappings
                dc.w    Offset_0x035124-Tornado_Mappings
                dc.w    Offset_0x035176-Tornado_Mappings
                dc.w    Offset_0x0351C8-Tornado_Mappings
Offset_0x0350D2:
                dc.w    $000A
                dc.l    $F00B0000, $0000FFA0
                dc.l    $1008000C, $0006FFA0
                dc.l    $030A000F, $0007FFB8
                dc.l    $F80902A0, $0150FFD0
                dc.l    $080E001E, $000FFFD0
                dc.l    $F80D002A, $0015FFE8
                dc.l    $F8000032, $00190008
                dc.l    $080E0033, $0019FFF0
                dc.l    $0802003F, $001F0010
                dc.l    $20050042, $0021FFF4
Offset_0x035124:
                dc.w    $000A
                dc.l    $F00B0000, $0000FFA0
                dc.l    $1008000C, $0006FFA0
                dc.l    $030A000F, $0007FFB8
                dc.l    $F80902A0, $0150FFD0
                dc.l    $080E001E, $000FFFD0
                dc.l    $F80D002A, $0015FFE8
                dc.l    $F8000032, $00190008
                dc.l    $080E0033, $0019FFF0
                dc.l    $08020046, $00230010
                dc.l    $20050042, $0021FFF4
Offset_0x035176:
                dc.w    $000A
                dc.l    $F00B0000, $0000FFA0
                dc.l    $1008000C, $0006FFA0
                dc.l    $030A000F, $0007FFB8
                dc.l    $F80902A0, $0150FFD0
                dc.l    $080E001E, $000FFFD0
                dc.l    $F80D002A, $0015FFE8
                dc.l    $F8000032, $00190008
                dc.l    $080E0033, $0019FFF0
                dc.l    $08020049, $00240010
                dc.l    $20050042, $0021FFF4
Offset_0x0351C8:
                dc.w    $000A
                dc.l    $F00B0000, $0000FFA0
                dc.l    $1008000C, $0006FFA0
                dc.l    $030A000F, $0007FFB8
                dc.l    $F80902A0, $0150FFD0
                dc.l    $080E001E, $000FFFD0
                dc.l    $F80D002A, $0015FFE8
                dc.l    $F8000032, $00190008
                dc.l    $080E0033, $0019FFF0
                dc.l    $0802004C, $00260010
                dc.l    $20050042, $0021FFF4                                                                                                                                               
;===============================================================================
; Objeto 0xB2 - Tornado na Sky Fortress / Sky Chase (Avião do Sonic)
; <<<- 
;===============================================================================