;===============================================================================
; Objeto 0x0E - Sonic e Miles na Tela Título
; ->>>        
;===============================================================================  
; Offset_0x00FC10:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00FC1E(PC, D0), D1
                jmp     Offset_0x00FC1E(PC, D1)
;-------------------------------------------------------------------------------                   
Offset_0x00FC1E:                                        
                dc.w    Offset_0x00FC26-Offset_0x00FC1E
                dc.w    Offset_0x00FC68-Offset_0x00FC1E
                dc.w    Offset_0x00FC7C-Offset_0x00FC1E
                dc.w    Offset_0x00FC92-Offset_0x00FC1E
;-------------------------------------------------------------------------------                    
Offset_0x00FC26:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0148, Obj_X(A0)                                ; $0008
                move.w  #$00C4, Obj_Sub_Y(A0)                            ; $000A
                move.l  #Sonic_Miles_Mappings, Obj_Map(A0) ; Offset_0x00FD76, $0004
                move.w  #$4200, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$1D, Obj_Ani_Time_2(A0)                         ; $001F
                tst.b   Obj_Map_Id(A0)                                   ; $001A
                beq.s   Offset_0x00FC68
                move.w  #$00FC, Obj_X(A0)                                ; $0008
                move.w  #$00CC, Obj_Sub_Y(A0)                            ; $000A
                move.w  #$2200, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x00FC68:
                bra     DisplaySprite                          ; Offset_0x0120DE
;------------------------------------------------------------------------------- 
Offset_0x00FC6C:
                subq.b  #$01, Obj_Ani_Time_2(A0)                         ; $001F
                bpl.s   Offset_0x00FC7A
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00FC7A:
                rts       
;-------------------------------------------------------------------------------  
Offset_0x00FC7C:
                subi.w  #$0008, Obj_Sub_Y(A0)                            ; $000A
                cmpi.w  #$0096, Obj_Sub_Y(A0)                            ; $000A
                bne.s   Offset_0x00FC8E
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x00FC8E:
                bra     DisplaySprite                          ; Offset_0x0120DE 
;-------------------------------------------------------------------------------                  
Offset_0x00FC92:
                bra     DisplaySprite                          ; Offset_0x0120DE                                                                                                   
;===============================================================================   
; Objeto 0x0E - Sonic e Miles na Tela Título
; <<<-        
;===============================================================================