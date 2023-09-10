;===============================================================================
; Objeto 0x95 - Inimigo Sol na Hill Top (Possui 4 Bolas de fogo girando em
; ->>>          torno de si e atira no jogador ao se aproximar)
;=============================================================================== 
; Offset_0x03154C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x03155A(PC, D0), D1
                jmp     Offset_0x03155A(PC, D1)        
;-------------------------------------------------------------------------------  
Offset_0x03155A:
                dc.w    Offset_0x031564-Offset_0x03155A
                dc.w    Offset_0x03162A-Offset_0x03155A
                dc.w    Offset_0x031672-Offset_0x03155A
                dc.w    Offset_0x03168A-Offset_0x03155A
                dc.w    Offset_0x031706-Offset_0x03155A               
;-------------------------------------------------------------------------------    
Offset_0x031564:
                move.l  #Sol_Mappings, Obj_Map(A0)      ; Offset_0x031734, $0004
                move.w  #$0000, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_3A_To_ModifySpriteAttr_2P          ; Offset_0x037638
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$0B, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$0C, Obj_Width(A0)                              ; $0019
                move.w  #$FFC0, Obj_Speed(A0)                            ; $0010
                moveq   #$00, D2
                lea     Obj_Control_Var_0B(A0), A2                       ; $0037
                move.l  A2, A3
                addq.w  #$01, A2
                moveq   #$03, D1
Offset_0x0315A0:
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x0315FC
                addq.b  #$01, (A3)
                move.w  A1, D5
                subi.w  #Obj_Memory_Address, D5                          ; $B000
                lsr.w   #$06, D5
                andi.w  #$007F, D5
                move.b  D5, (A2)+
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.b  #$06, Obj_Routine(A1)                            ; $0024
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.b  #$08, Obj_Width(A1)                              ; $0019
                move.b  #$03, Obj_Map_Id(A1)                             ; $001A
                move.b  #$98, Obj_Col_Flags(A1)                          ; $0020
                move.b  D2, Obj_Angle(A1)                                ; $0026
                addi.b  #$40, D2
                move.l  A0, Obj_Control_Var_10(A1)                       ; $003C
                dbra    D1, Offset_0x0315A0
Offset_0x0315FC:
                moveq   #$01, D0
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x031608
                neg.w   D0
Offset_0x031608:
                move.b  D0, Obj_Control_Var_0A(A0)                       ; $0036
                move.b  Obj_Subtype(A0), Obj_Routine(A0)          ; $0024, $0028
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$FFC0, Obj_Speed(A0)                            ; $0010
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x031628
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x031628:
                rts   
;------------------------------------------------------------------------------- 
Offset_0x03162A:
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                sub.w   Obj_X(A0), D0                                    ; $0008
                bcc.s   Offset_0x031636
                neg.w   D0
Offset_0x031636:
                cmpi.w  #$00A0, D0
                bcc.s   Offset_0x03165A
                move.w  (Player_Position_Y).w, D0                    ; $FFFFB00C
                sub.w   Obj_Y(A0), D0                                    ; $000C
                bcc.s   Offset_0x031648
                neg.w   D0
Offset_0x031648:
                cmpi.w  #$0050, D0
                bcc.s   Offset_0x03165A
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne.s   Offset_0x03165A
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
Offset_0x03165A:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Sol_Animate_Data), A1                 ; Offset_0x031720
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                andi.b  #$03, Obj_Map_Id(A0)                             ; $001A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608  
;------------------------------------------------------------------------------- 
Offset_0x031672:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Sol_Animate_Data_01), A1              ; Offset_0x03172E
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                andi.b  #$03, Obj_Map_Id(A0)                             ; $001A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608    
;------------------------------------------------------------------------------- 
Offset_0x03168A:
                lea     (Sol_Animate_Data_01), A1              ; Offset_0x03172E
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                cmpi.b  #$95, Obj_Id(A1)                                 ; $0000
                bne     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                cmpi.b  #$02, Obj_Map_Id(A1)                             ; $001A
                bne.s   Offset_0x0316DC
                cmpi.b  #$40, Obj_Angle(A0)                              ; $0026
                bne.s   Offset_0x0316DC
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                subq.b  #$01, Obj_Control_Var_0B(A1)                     ; $0037
                bne.s   Offset_0x0316C6
                addq.b  #$02, Obj_Routine(A1)                            ; $0024
Offset_0x0316C6:
                move.w  #$FE00, Obj_Speed(A0)                            ; $0010
                btst    #$00, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x0316D8
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x0316D8:
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x0316DC:
                move.b  Obj_Angle(A0), D0                                ; $0026
                jsr     (CalcSine)                             ; Offset_0x00396A
                asr.w   #$04, D1
                add.w   Obj_X(A1), D1                                    ; $0008
                move.w  D1, Obj_X(A0)                                    ; $0008
                asr.w   #$04, D0
                add.w   Obj_Y(A1), D0                                    ; $000C
                move.w  D0, Obj_Y(A0)                                    ; $000C
                move.b  Obj_Control_Var_0A(A1), D0                       ; $0036
                add.b   D0, Obj_Angle(A0)                                ; $0026
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;------------------------------------------------------------------------------- 
Offset_0x031706:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                lea     (Sol_Animate_Data_01), A1              ; Offset_0x03172E
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6    
;-------------------------------------------------------------------------------      
Sol_Animate_Data:                                              ; Offset_0x031720
                dc.w    Offset_0x031724-Sol_Animate_Data
                dc.w    Offset_0x031728-Sol_Animate_Data
Offset_0x031724:
                dc.b    $0F, $00, $FF, $00
Offset_0x031728:
                dc.b    $0F, $01, $02, $FE, $01, $00                       
;-------------------------------------------------------------------------------  
Sol_Animate_Data_01:                                           ; Offset_0x03172E
                dc.w    Offset_0x031730-Sol_Animate_Data_01
Offset_0x031730:
                dc.b    $05, $03, $04, $FF  
;------------------------------------------------------------------------------- 
Sol_Mappings:                                                  ; Offset_0x031734
                dc.w    Offset_0x03173E-Sol_Mappings
                dc.w    Offset_0x031748-Sol_Mappings
                dc.w    Offset_0x031752-Sol_Mappings
                dc.w    Offset_0x03175C-Sol_Mappings
                dc.w    Offset_0x031766-Sol_Mappings
Offset_0x03173E:
                dc.w    $0001
                dc.l    $F80503DE, $01EFFFF8
Offset_0x031748:
                dc.w    $0001
                dc.l    $F80503DE, $01EFFFF8
Offset_0x031752:
                dc.w    $0001
                dc.l    $F80503DE, $01EFFFF8
Offset_0x03175C:
                dc.w    $0001
                dc.l    $F80583AE, $81D7FFF8
Offset_0x031766:
                dc.w    $0001
                dc.l    $F8058BAE, $89D7FFF8
;===============================================================================
; Objeto 0x95 - Inimigo Sol na Hill Top (Possui 4 Bolas de fogo girando em
; <<<-          torno de si e atira no jogador ao se aproximar)
;===============================================================================