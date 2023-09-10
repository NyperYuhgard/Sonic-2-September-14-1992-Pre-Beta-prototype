;===============================================================================
; Objeto 0x0F - Opções na Tela Título (1 Player / 2 Player Vs)
; ->>>        
;===============================================================================     
; Offset_0x00FC96:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00FCA8(PC, D0), D1
                jsr     Offset_0x00FCA8(PC, D1)
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------
Offset_0x00FCA8:                
                dc.w    Offset_0x00FCAC-Offset_0x00FCA8
                dc.w    Offset_0x00FCCE-Offset_0x00FCA8  
;-------------------------------------------------------------------------------
Offset_0x00FCAC:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0128, Obj_X(A0)                                ; $0008
                move.w  #$014C, Obj_Sub_Y(A0)                            ; $000A
                move.l  #_1Player2Vs_Options_Mappings, Obj_Map(A0) ; Offset_0x00FCFE, $0004
                move.w  #$02F0, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
;-------------------------------------------------------------------------------                
Offset_0x00FCCE:
                move.b  (Control_Ports_Buffer_Data+$0001).w, D0      ; $FFFFF605
                andi.b  #$03, D0
                beq.s   Offset_0x00FCDE
                bchg    #00, Obj_Map_Id(A0)                              ; $001A
Offset_0x00FCDE:
                rts                                                                                    
;===============================================================================   
; Objeto 0x0F - Opções na Tela Título (1 Player / 2 Player Vs)
; <<<-        
;===============================================================================