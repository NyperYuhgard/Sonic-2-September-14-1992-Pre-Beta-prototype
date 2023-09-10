;===============================================================================
; Objeto 0xA2 - Sub-objeto usado pelo inimigo Slicer na Metropolis
; ->>>          Facas que são atiradas no jogador
;===============================================================================
Offset_0x0328C0:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0328CE(PC, D0), D1
                jmp     Offset_0x0328CE(PC, D1)     
;-------------------------------------------------------------------------------   
Offset_0x0328CE:
                dc.w    Offset_0x0328D4-Offset_0x0328CE
                dc.w    Offset_0x032902-Offset_0x0328CE
                dc.w    Offset_0x032950-Offset_0x0328CE
;-------------------------------------------------------------------------------  
Offset_0x0328D4:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.w  #$FE00, Obj_Speed(A0)                            ; $0010
                move.w  #$0200, Obj_Timer(A0)                            ; $002A
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                lea     Offset_0x0328FE(PC, D0), A2
                move.b  (A2)+, D0
                ext.w   D0
                add.w   D0, Obj_X(A0)                                    ; $0008
                move.b  (A2)+, D0
                ext.w   D0
                add.w   D0, Obj_Y(A0)                                    ; $000C
                rts             
;-------------------------------------------------------------------------------   
Offset_0x0328FE:
                dc.w    $0600, $F000            
;-------------------------------------------------------------------------------      
Offset_0x032902:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x032946
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                cmpi.b  #$A1, (A1)
                bne.s   Offset_0x032946
                bsr     Offset_0x030B18
                move.w  Offset_0x032942(PC, D0), D2
                add.w   D2, Obj_Speed(A0)                                ; $0010
                move.w  Offset_0x032942(PC, D1), D2
                add.w   D2, Obj_Speed_Y(A0)                              ; $0012
                move.w  #$0200, D0
                move.w  D0, D1
                bsr     Offset_0x030B9E
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Slicer_Pincers_Animate_Data), A1      ; Offset_0x0329C2
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608   
;-------------------------------------------------------------------------------    
Offset_0x032942:
                dc.w    $FFF0, $0010
;-------------------------------------------------------------------------------  
Offset_0x032946:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0080, Obj_Timer(A0)                            ; $002A
Offset_0x032950:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                bsr     Jmp_0B_To_ObjectFall                   ; Offset_0x037650
                lea     (Slicer_Pincers_Animate_Data), A1      ; Offset_0x0329C2
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                  
Load_Slicer_Pincers_Obj:                                       ; Offset_0x03296A
                moveq   #$00, D1
                moveq   #$01, D6
Offset_0x03296E:
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x0329A6
                move.b  #$A2, Obj_Id(A1)                                 ; $0000
                move.b  #$2A, Obj_Subtype(A1)                            ; $0028
                move.b  #$05, Obj_Map_Id(A1)                             ; $001A
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.w  A0, Obj_Control_Var_00(A1)                       ; $002C
                move.w  D1, Obj_Control_Var_02(A1)                       ; $002E
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addq.w  #$02, D1
                dbra    D6, Offset_0x03296E
Offset_0x0329A6:
                rts     
;-------------------------------------------------------------------------------  
Obj_0xA1_Ptr:                                                  ; Offset_0x0329A8
                dc.l    Slicer_Mappings                        ; Offset_0x0329CA
                dc.w    $243C
                dc.b    $04, $05, $10, $06        
;-------------------------------------------------------------------------------
Obj_0xA2_Ptr:                                                  ; Offset_0x0329B2
                dc.l    Slicer_Mappings                        ; Offset_0x0329CA
                dc.w    $243C
                dc.b    $04, $04, $10, $9A  
;-------------------------------------------------------------------------------
Slicer_Animate_Data:                                           ; Offset_0x0329BC
                dc.w    Offset_0x0329BE-Slicer_Animate_Data     
Offset_0x0329BE:
                dc.b    $13, $00, $02, $FF                
;-------------------------------------------------------------------------------
Slicer_Pincers_Animate_Data:                                   ; Offset_0x0329C2
                dc.w    Offset_0x0329C4-Slicer_Pincers_Animate_Data
Offset_0x0329C4:
                dc.b    $03, $05, $06, $07, $08, $FF                 
;------------------------------------------------------------------------------- 
Slicer_Mappings:                                               ; Offset_0x0329CA
                dc.w    Offset_0x0329DC-Slicer_Mappings
                dc.w    Offset_0x032A16-Slicer_Mappings
                dc.w    Offset_0x032A50-Slicer_Mappings
                dc.w    Offset_0x032A8A-Slicer_Mappings
                dc.w    Offset_0x032AC4-Slicer_Mappings
                dc.w    Offset_0x032ADE-Slicer_Mappings
                dc.w    Offset_0x032AF0-Slicer_Mappings
                dc.w    Offset_0x032B02-Slicer_Mappings
                dc.w    Offset_0x032B14-Slicer_Mappings
Offset_0x0329DC:
                dc.w    $0007
                dc.l    $F904001A, $000DFFF4
                dc.l    $0100001C, $000EFFF4
                dc.l    $F0090000, $0000FFF0
                dc.l    $00090006, $0003FFF0
                dc.l    $0001000C, $00060008
                dc.l    $F704001A, $000DFFE0
                dc.l    $FF00001C, $000EFFE0
Offset_0x032A16:
                dc.w    $0007
                dc.l    $F804001A, $000DFFF4
                dc.l    $0000001C, $000EFFF4
                dc.l    $F0090000, $0000FFF0
                dc.l    $0009000E, $0007FFF0
                dc.l    $0001000C, $00060008
                dc.l    $F804001A, $000DFFE0
                dc.l    $0000001C, $000EFFE0
Offset_0x032A50:
                dc.w    $0007
                dc.l    $F704001A, $000DFFF4
                dc.l    $FF00001C, $000EFFF4
                dc.l    $F0090000, $0000FFF0
                dc.l    $00090014, $000AFFF0
                dc.l    $0001000C, $00060008
                dc.l    $F904001A, $000DFFE0
                dc.l    $0100001C, $000EFFE0
Offset_0x032A8A:
                dc.w    $0007
                dc.l    $E004181E, $180FFFF4
                dc.l    $E800181D, $180EFFFC
                dc.l    $F0090000, $0000FFF0
                dc.l    $00090006, $0003FFF0
                dc.l    $0001000C, $00060008
                dc.l    $E004181E, $180FFFE0
                dc.l    $E800181D, $180EFFE8
Offset_0x032AC4:
                dc.w    $0003
                dc.l    $F0090000, $0000FFF0
                dc.l    $00090006, $0003FFF0
                dc.l    $0001000C, $00060008
Offset_0x032ADE:
                dc.w    $0002
                dc.l    $F004001A, $000DFFF0
                dc.l    $F800001C, $000EFFF0
Offset_0x032AF0:
                dc.w    $0002
                dc.l    $0000001D, $000EFFF0
                dc.l    $0804001E, $000FFFF0
Offset_0x032B02:
                dc.w    $0002
                dc.l    $0000181C, $180E0008
                dc.l    $0804181A, $180D0000
Offset_0x032B14:
                dc.w    $0002
                dc.l    $F004181E, $180F0000
                dc.l    $F800181D, $180E0008                                                                                                                               
;===============================================================================
; Objeto 0xA2 - Sub-objeto usado pelo inimigo Slicer na Metropolis
; <<<-          Facas que são atiradas no jogador
;===============================================================================