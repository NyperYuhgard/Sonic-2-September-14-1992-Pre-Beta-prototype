;===============================================================================
; Objeto 0x99 - Inimigo Nebula na Sky Chase  (Joga bombas no jogador)
; ->>>        
;===============================================================================     
; Offset_0x031C16:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x031C24(PC, D0), D1
                jmp     Offset_0x031C24(PC, D1)  
;-------------------------------------------------------------------------------                        
Offset_0x031C24:
                dc.w    Offset_0x031C2A-Offset_0x031C24
                dc.w    Offset_0x031C36-Offset_0x031C24
                dc.w    Offset_0x031C6A-Offset_0x031C24                           
;-------------------------------------------------------------------------------  
Offset_0x031C2A:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.w  #$FF40, Obj_Speed(A0)                            ; $0010  
;-------------------------------------------------------------------------------  
                rts
Offset_0x031C36:
                bsr     Offset_0x030B18
                tst.w   D0
                bne.s   Offset_0x031C48
                cmpi.w  #$0080, D2
                bcc.s   Offset_0x031C48
                bsr     Offset_0x031C5E
Offset_0x031C48:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bsr     Offset_0x030C20
                lea     (Nebula_Animate_Data), A1              ; Offset_0x031CE0
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Offset_0x030C32
Offset_0x031C5E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$FF60, Obj_Speed_Y(A0)                          ; $0012
                rts    
;-------------------------------------------------------------------------------  
Offset_0x031C6A:
                tst.b   Obj_Timer(A0)                                    ; $002A
                bne.s   Offset_0x031C82
                bsr     Offset_0x030B18
                addi.w  #$0008, D2
                cmpi.w  #$0010, D2
                bcc.s   Offset_0x031C82
                bsr     Offset_0x031C9E
Offset_0x031C82:
                addi.w  #$0001, Obj_Speed_Y(A0)                          ; $0012
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bsr     Offset_0x030C20
                lea     (Nebula_Animate_Data), A1              ; Offset_0x031CE0
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Offset_0x030C32
Offset_0x031C9E:
                st      Obj_Timer(A0)                                    ; $002A
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x031CD4
                move.b  #$98, Obj_Id(A1)                                 ; $0000
                move.b  #$04, Obj_Map_Id(A1)                             ; $001A
                move.b  #$14, Obj_Subtype(A1)                            ; $0028
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$0018, Obj_Y(A1)                                ; $000C
                lea     Nebula_Weapon(PC), A2                  ; Offset_0x031B5E
                move.l  A2, Obj_Timer(A1)                                ; $002A
Offset_0x031CD4:
                rts                                                                
;-------------------------------------------------------------------------------  
Obj_0x99_Ptr:                                                  ; Offset_0x031CD6
                dc.l    Nebula_Mappings                        ; Offset_0x031CE8
                dc.w    $A36E
                dc.b    $04, $04, $10, $06                                        
;-------------------------------------------------------------------------------  
Nebula_Animate_Data:                                           ; Offset_0x031CE0
                dc.w    Offset_0x031CE2-Nebula_Animate_Data
Offset_0x031CE2:
                dc.b    $03, $00, $01, $02, $03, $FF              
;-------------------------------------------------------------------------------  
Nebula_Mappings:                                               ; Offset_0x031CE8
                dc.w    Offset_0x031CF2-Nebula_Mappings
                dc.w    Offset_0x031D14-Nebula_Mappings
                dc.w    Offset_0x031D36-Nebula_Mappings
                dc.w    Offset_0x031D58-Nebula_Mappings
                dc.w    Offset_0x031D7A-Nebula_Mappings
Offset_0x031CF2:
                dc.w    $0004
                dc.l    $EC080012, $0009FFE8
                dc.l    $EC081812, $18090000
                dc.l    $EC040000, $0000FFF8
                dc.l    $F40F0002, $0001FFF0
Offset_0x031D14:
                dc.w    $0004
                dc.l    $EC040015, $000AFFF0
                dc.l    $EC041815, $180A0000
                dc.l    $EC040000, $0000FFF8
                dc.l    $F40F0002, $0001FFF0
Offset_0x031D36:
                dc.w    $0004
                dc.l    $EC000017, $000BFFF8
                dc.l    $EC000817, $080B0000
                dc.l    $EC040000, $0000FFF8
                dc.l    $F40F0002, $0001FFF0
Offset_0x031D58:
                dc.w    $0004
                dc.l    $EC041015, $100AFFF0
                dc.l    $EC040815, $080A0000
                dc.l    $EC040000, $0000FFF8
                dc.l    $F40F0002, $0001FFF0
Offset_0x031D7A:
                dc.w    $0001
                dc.l    $F8050018, $000CFFF8
;===============================================================================   
; Objeto 0x99 - Inimigo Nebula na Sky Chase  (Joga bombas no jogador)
; <<<-        
;===============================================================================