;===============================================================================
; Objeto 0xA3 - Inimigo vagalume na Dust Hill
; ->>>        
;===============================================================================     
; Offset_0x032B26:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x032B34(PC, D0), D1
                jmp     Offset_0x032B34(PC, D1)             
Offset_0x032B34:
                dc.w    Offset_0x032B42-Offset_0x032B34
                dc.w    Offset_0x032B4E-Offset_0x032B34
                dc.w    Offset_0x032B7C-Offset_0x032B34
                dc.w    Offset_0x032C1A-Offset_0x032B34
                dc.w    Offset_0x032C44-Offset_0x032B34
                dc.w    Offset_0x032C68-Offset_0x032B34
                dc.w    Offset_0x032C76-Offset_0x032B34    
;-------------------------------------------------------------------------------   
Offset_0x032B42:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.w  #$0040, Obj_Timer(A0)                            ; $002A
                rts       
;-------------------------------------------------------------------------------
Offset_0x032B4E:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x032B58
                bra     Jmp_01_MarkObjGone_4                   ; Offset_0x03762C
Offset_0x032B58:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$FF00, Obj_Speed(A0)                            ; $0010
                move.w  #$0040, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$0002, Obj_Control_Var_02(A0)                   ; $002E
                clr.w   Obj_Timer(A0)                                    ; $002A
                move.w  #$0080, Obj_Control_Var_04(A0)                   ; $0030
                bra     Jmp_01_MarkObjGone_4                   ; Offset_0x03762C  
;-------------------------------------------------------------------------------
Offset_0x032B7C:
                subq.w  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bmi.s   Offset_0x032BE4
                move.w  Obj_Timer(A0), D0                                ; $002A
                bmi     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                bclr    #$00, Obj_Status(A0)                             ; $0022
                tst.w   Obj_Speed(A0)                                    ; $0010
                bmi.s   Offset_0x032BA8
                bset    #$00, Obj_Flags(A0)                              ; $0001
                bset    #$00, Obj_Status(A0)                             ; $0022
Offset_0x032BA8:
                addq.w  #$01, D0
                move.w  D0, Obj_Timer(A0)                                ; $002A
                move.w  Obj_Control_Var_00(A0), D1                       ; $002C
                move.w  Offset_0x032BF8(PC, D1), D2
                cmp.w   D2, D0
                bcs.s   Offset_0x032BD4
                addq.w  #$02, D1
                move.w  D1, Obj_Control_Var_00(A0)                       ; $002C
                lea     Offset_0x032C08(PC, D1), A1
                tst.b   (A1)+
                beq.s   Offset_0x032BCC
                neg.w   Obj_Control_Var_02(A0)                           ; $002E
Offset_0x032BCC:
                tst.b   (A1)+
                beq.s   Offset_0x032BD4
                neg.w   Obj_Speed_Y(A0)                                  ; $0012
Offset_0x032BD4:
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                add.w   D0, Obj_Speed(A0)                                ; $0010
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bra     Jmp_01_MarkObjGone_4                   ; Offset_0x03762C
Offset_0x032BE4:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0080, Obj_Control_Var_04(A0)                   ; $0030
                ori.b   #$80, Obj_Col_Flags(A0)                          ; $0020
                bra     Jmp_01_MarkObjGone_4                   ; Offset_0x03762C  
;-------------------------------------------------------------------------------  
Offset_0x032BF8:
                dc.w    $0100, $01A0, $0208, $0285, $0300, $0340, $0390, $0440    
;-------------------------------------------------------------------------------
Offset_0x032C08:
                dc.b    $F0, $00, $01, $01, $00, $01, $01, $01
                dc.b    $00, $01, $00, $01, $01, $00, $00, $01
                dc.b    $00, $01   
;-------------------------------------------------------------------------------       
Offset_0x032C1A:
                move.b  Obj_Routine(A0), D2                              ; $0024
                lea     (Flasher_Animate_Data), A1             ; Offset_0x032C9E
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                cmp.b   Obj_Routine(A0), D2                              ; $0024
                bne.s   Offset_0x032C32
                bra     Jmp_01_MarkObjGone_4                   ; Offset_0x03762C
Offset_0x032C32:
                clr.l   Obj_Map_Id(A0)                                   ; $001A
                clr.w   Obj_Ani_Time(A0)                                 ; $001E
                move.b  #$03, Obj_Map_Id(A0)                             ; $001A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608     
;-------------------------------------------------------------------------------
Offset_0x032C44:
                subq.w  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bmi.s   Offset_0x032C58
                lea     (Flasher_Animate_Data_01), A1          ; Offset_0x032CC2
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_01_MarkObjGone_4                   ; Offset_0x03762C
Offset_0x032C58:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                clr.l   Obj_Map_Id(A0)                                   ; $001A
                clr.w   Obj_Ani_Time(A0)                                 ; $001E
                bra     Jmp_01_MarkObjGone_4                   ; Offset_0x03762C   
;-------------------------------------------------------------------------------
Offset_0x032C68:
                lea     (Flasher_Animate_Data_02), A1          ; Offset_0x032CCE
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_01_MarkObjGone_4                   ; Offset_0x03762C  
;-------------------------------------------------------------------------------
Offset_0x032C76:
                move.b  #$04, Obj_Routine(A0)                            ; $0024
                move.w  #$0080, Obj_Control_Var_04(A0)                   ; $0030
                andi.b  #$7F, Obj_Col_Flags(A0)                          ; $0020
                clr.l   Obj_Map_Id(A0)                                   ; $001A
                clr.w   Obj_Ani_Time(A0)                                 ; $001E
                bra     Jmp_01_MarkObjGone_4                   ; Offset_0x03762C   
;-------------------------------------------------------------------------------
Obj_0xA3_Ptr:                                                  ; Offset_0x032C94
                dc.l    Flasher_Mappings                       ; Offset_0x032CD8
                dc.w    $83A8
                dc.b    $04, $04, $10, $06       
;-------------------------------------------------------------------------------
Flasher_Animate_Data:                                          ; Offset_0x032C9E
                dc.w    Offset_0x032CA0-Flasher_Animate_Data
Offset_0x032CA0:
                dc.b    $00, $00, $01, $00, $00, $00, $00, $00
                dc.b    $01, $00, $00, $00, $01, $00, $00, $01
                dc.b    $00, $01, $00, $01, $00, $01, $00, $01
                dc.b    $00, $01, $00, $01, $00, $02, $03, $04
                dc.b    $FC, $00                                
;-------------------------------------------------------------------------------
Flasher_Animate_Data_01:                                       ; Offset_0x032CC2
                dc.w    Offset_0x032CC4-Flasher_Animate_Data_01
Offset_0x032CC4:
                dc.b    $00, $02, $00, $03, $00, $04, $00, $03
                dc.b    $00, $FF                                     
;-------------------------------------------------------------------------------
Flasher_Animate_Data_02:                                       ; Offset_0x032CCE
                dc.w    Offset_0x032CD0-Flasher_Animate_Data_02
Offset_0x032CD0:
                dc.b    $03, $04, $03, $02, $01, $00, $FC, $00    
;-------------------------------------------------------------------------------
Flasher_Mappings:                                              ; Offset_0x032CD8
                dc.w    Offset_0x032CE2-Flasher_Mappings
                dc.w    Offset_0x032CEC-Flasher_Mappings
                dc.w    Offset_0x032CFE-Flasher_Mappings
                dc.w    Offset_0x032D20-Flasher_Mappings
                dc.w    Offset_0x032D52-Flasher_Mappings
Offset_0x032CE2:
                dc.w    $0001
                dc.l    $F8090000, $0000FFF0
Offset_0x032CEC:
                dc.w    $0002
                dc.l    $F8052006, $2003FFF8
                dc.l    $F8090000, $0000FFF0
Offset_0x032CFE:
                dc.w    $0004
                dc.l    $F801200A, $2005FFF8
                dc.l    $F801280A, $28050000
                dc.l    $F8052006, $2003FFF8
                dc.l    $F8090000, $0000FFF0
Offset_0x032D20:
                dc.w    $0006
                dc.l    $F005200C, $2006FFF0
                dc.l    $F005280C, $28060000
                dc.l    $0005300C, $3006FFF0
                dc.l    $0005380C, $38060000
                dc.l    $F8052006, $2003FFF8
                dc.l    $F8090000, $0000FFF0
Offset_0x032D52:
                dc.w    $0006
                dc.l    $F0052010, $2008FFF0
                dc.l    $F0052810, $28080000
                dc.l    $00053010, $3008FFF0
                dc.l    $00053810, $38080000
                dc.l    $F8052006, $2003FFF8
                dc.l    $F8090000, $0000FFF0
;===============================================================================   
; Objeto 0xA3 - Inimigo vagalume na Dust Hill
; <<<-        
;===============================================================================