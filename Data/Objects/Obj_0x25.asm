;===============================================================================
; Objeto 0x25 - Anéis - Este objeto não é usado pelos anéis normais nas fases
; ->>>        
;===============================================================================  
; Offset_0x00F034:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00F042(PC, D0), D1
                jmp     Offset_0x00F042(PC, D1)    
Offset_0x00F042:                
                dc.w    Offset_0x00F06C-Offset_0x00F042
                dc.w    Offset_0x00F0DA-Offset_0x00F042
                dc.w    Offset_0x00F0F6-Offset_0x00F042
                dc.w    Offset_0x00F11C-Offset_0x00F042
                dc.w    Offset_0x00F12A-Offset_0x00F042     
;-------------------------------------------------------------------------------
; Offset_0x00F04C:  ; Dados não usados, Left over do Sonic 1
                dc.b    $10, $00, $18, $00, $20, $00, $00, $10
                dc.b    $00, $18, $00, $20, $10, $10, $18, $18
                dc.b    $20, $20, $F0, $10, $E8, $18, $E0, $20
                dc.b    $10, $08, $18, $10, $F0, $08, $E8, $10                                 
;-------------------------------------------------------------------------------
Offset_0x00F06C:
                move.l  A0, A1
                moveq   #$00, D1
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  Obj_Y(A0), D3                                    ; $000C
                bra.s   Offset_0x00F082 
;-------------------------------------------------------------------------------
Offset_0x00F07A:
                swap.w  D1
                bsr     SingleObjectLoad                       ; Offset_0x013BAA
                bne.s   Offset_0x00F0DA
Offset_0x00F082:
                move.b  #$25, Obj_Id(A1)                                 ; $0000
                addq.b  #$02, Obj_Routine(A1)                            ; $0024
                move.w  D2, Obj_X(A1)                                    ; $0008
                move.w  Obj_X(A0), $0032(A1)                             ; $0008
                move.w  D3, Obj_Y(A1)                                    ; $000C
                move.l  #Rings_Mappings, Obj_Map(A1)    ; Offset_0x00F444, $0004
                move.w  #$26BC, Obj_Art_VRAM(A1)                         ; $0002
                bsr     ModifySpriteAttr_2P_A1                 ; Offset_0x0129AA
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$02, Obj_Priority(A1)                           ; $0018
                move.b  #$47, Obj_Col_Flags(A1)                          ; $0020
                move.b  #$08, Obj_Width(A1)                              ; $0019
                move.b  Obj_Respaw_Ref(A0), Obj_Respaw_Ref(A1)           ; $0023
                move.b  D1, $0034(A1)
                addq.w  #$01, D1
                add.w   D5, D2
                add.w   D6, D3
                swap.w  D1
                dbra    D1, Offset_0x00F07A
Offset_0x00F0DA:
                move.b  ($FFFFFEA3).w, Obj_Map_Id(A0)                    ; $001A
                move.w  $0032(A0), D0                                    ; $0032
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x00F12A
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00F0F6:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                bsr     Add_Rings                              ; Offset_0x00F12E
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                move.b  $0034(A0), D1  
                bset    D1, $02(A2, D0)
Offset_0x00F11C:
                lea     (Rings_Animate_Data), A1               ; Offset_0x00F43C
                bsr     AnimateSprite                          ; Offset_0x01212E
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00F12A:
                bra     DeleteObject                           ; Offset_0x0120D0                                                          
;===============================================================================   
; Objeto 0x25 - Anéis - Este objeto não é usado pelos anéis normais nas fases
; <<<-        
;===============================================================================