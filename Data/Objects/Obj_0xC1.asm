;===============================================================================
; Objeto 0xC1 - Parede que se destrói quando o jogador segura na Sky Fortress
; ->>> 
;=============================================================================== 
; Offset_0x035F44:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x035F52(PC, D0), D1
                jmp     Offset_0x035F52(PC, D1)     
;-------------------------------------------------------------------------------  
Offset_0x035F52:
                dc.w    Offset_0x035F58-Offset_0x035F52
                dc.w    Offset_0x035F6E-Offset_0x035F52
                dc.w    Offset_0x036042-Offset_0x035F52
;------------------------------------------------------------------------------- 
Offset_0x035F58:
                move.w  #$0080, D0
                bsr     Object_Settings_D0                     ; Offset_0x030A36
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                mulu.w  #$003C, D0
                move.w  D0, Obj_Control_Var_04(A0)                       ; $0030
;-------------------------------------------------------------------------------                
Offset_0x035F6E:
                tst.b   Obj_Control_Var_06(A0)                           ; $0032
                beq.s   Offset_0x035FD8
                tst.w   Obj_Control_Var_04(A0)                           ; $0030
                beq.s   Offset_0x035F80
                subq.w  #$01, Obj_Control_Var_04(A0)                     ; $0030
                beq.s   Offset_0x035FC6
Offset_0x035F80:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.w  Obj_Y(A0), D0                                    ; $000C
                subi.w  #$0018, D0
                btst    #$00, (Control_Ports_Buffer_Data).w          ; $FFFFF604
                beq.s   Offset_0x035FA2
                subq.w  #$01, Obj_Y(A1)                                  ; $000C
                cmp.w   Obj_Y(A1), D0                                    ; $000C
                bcs.s   Offset_0x035FA2
                move.w  D0, Obj_Y(A1)                                    ; $000C
Offset_0x035FA2:
                addi.w  #$0030, D0
                btst    #$01, (Control_Ports_Buffer_Data).w          ; $FFFFF604
                beq.s   Offset_0x035FBC
                addq.w  #$01, Obj_Y(A1)                                  ; $000C
                cmp.w   Obj_Y(A1), D0                                    ; $000C
                bcc.s   Offset_0x035FBC
                move.w  D0, Obj_Y(A1)                                    ; $000C
Offset_0x035FBC:
                move.b  ($FFFFF603).w, D0
                andi.w  #$0070, D0
                beq.s   Offset_0x03602E
Offset_0x035FC6:
                clr.b   Obj_Col_Flags(A0)                                ; $0020
                clr.b   ($FFFFB02A).w
                clr.b   ($FFFFF7C9).w
                clr.b   Obj_Control_Var_06(A0)                           ; $0032
                bra.s   Offset_0x036032
Offset_0x035FD8:
                tst.b   Obj_Col_Prop(A0)                                 ; $0021
                beq.s   Offset_0x03602E
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.w  Obj_X(A0), D0                                    ; $0008
                subi.w  #$0014, D0
                cmp.w   Obj_X(A1), D0                                    ; $0008
                bcc.s   Offset_0x03602E
                clr.b   Obj_Col_Prop(A0)                                 ; $0021
                cmpi.b  #$04, Obj_Routine(A1)                            ; $0024
                bcc.s   Offset_0x03602E
                clr.w   Obj_Speed(A1)                                    ; $0010
                clr.w   Obj_Speed_Y(A1)                                  ; $0012
                move.w  Obj_X(A0), D0                                    ; $0008
                subi.w  #$0014, D0
                move.w  D0, Obj_X(A1)                                    ; $0008
                bset    #$00, Obj_Status(A1)                             ; $0022
                move.b  #$11, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$01, ($FFFFB02A).w
                move.b  #$01, ($FFFFF7C9).w
                move.b  #$01, Obj_Control_Var_06(A0)                     ; $0032
Offset_0x03602E:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x036032:
                lea     (Offset_0x03607C), A4
                lea     (Offset_0x036078), A2
                bsr     Offset_0x03608C
;-------------------------------------------------------------------------------                
Offset_0x036042:
                tst.b   Obj_Control_Var_13(A0)                           ; $003F
                beq.s   Offset_0x03604E
                subq.b  #$01, Obj_Control_Var_13(A0)                     ; $003F
                bra.s   Offset_0x036062
Offset_0x03604E:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                addi.w  #$0008, Obj_Speed_Y(A0)                          ; $0012
                lea     (Breakable_Wall_Animate_Data), A1      ; Offset_0x03606E
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
Offset_0x036062:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
;-------------------------------------------------------------------------------    
Breakable_Wall_Animate_Data:                                   ; Offset_0x03606E
                dc.w    Offset_0x036070-Breakable_Wall_Animate_Data
Offset_0x036070:
                dc.b    $03, $02, $03, $04, $05, $01, $FF, $00  
;-------------------------------------------------------------------------------  
Offset_0x036078:
                dc.b    $00, $04, $18, $20
;-------------------------------------------------------------------------------
Offset_0x03607C:
                dc.w    $FFF0, $FFF0, $FFF0, $0010, $FFD0, $FFF0, $FFD0, $0010  
;-------------------------------------------------------------------------------      
Offset_0x03608C:
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  Obj_Y(A0), D3                                    ; $000C
                move.b  Obj_Priority(A0), D4                             ; $0018
                subq.b  #$01, D4
                moveq   #$03, D1
                move.l  A0, A1
                bra.s   Offset_0x0360A6 
;-------------------------------------------------------------------------------  
Offset_0x0360A0:
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x036104
Offset_0x0360A6:
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.b  #$84, Obj_Flags(A1)                              ; $0001
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  (A4)+, D0
                add.w   D2, D0
                move.w  D0, Obj_X(A1)                                    ; $0008
                move.w  (A4)+, D0
                add.w   D3, D0
                move.w  D0, Obj_Y(A1)                                    ; $000C
                move.b  D4, Obj_Priority(A1)                             ; $0018
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  #$01, Obj_Map_Id(A1)                             ; $001A
                move.w  #$FC00, Obj_Speed(A1)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
                move.b  (A2)+, Obj_Control_Var_13(A1)                    ; $003F
                dbra    D1, Offset_0x0360A0
Offset_0x036104:
                move.w  #$00CB, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912  
;-------------------------------------------------------------------------------    
Obj_0xC1_Ptr:                                                  ; Offset_0x03610E
                dc.l    Breakable_Wall_Mappings                ; Offset_0x036118
                dc.w    $E48C
                dc.b    $04, $04, $40, $E1       
;-------------------------------------------------------------------------------   
Breakable_Wall_Mappings:                                       ; Offset_0x036118
                dc.w    Offset_0x036124-Breakable_Wall_Mappings
                dc.w    Offset_0x036166-Breakable_Wall_Mappings
                dc.w    Offset_0x036178-Breakable_Wall_Mappings
                dc.w    Offset_0x03618A-Breakable_Wall_Mappings
                dc.w    Offset_0x03619C-Breakable_Wall_Mappings
                dc.w    Offset_0x0361AE-Breakable_Wall_Mappings
Offset_0x036124:
                dc.w    $0008
                dc.l    $E0070000, $0000FFE0
                dc.l    $E0070800, $0800FFF0
                dc.l    $00070000, $0000FFE0
                dc.l    $00070800, $0800FFF0
                dc.l    $E0070000, $0000FFC0
                dc.l    $E0070800, $0800FFD0
                dc.l    $00070000, $0000FFC0
                dc.l    $00070800, $0800FFD0
Offset_0x036166:
                dc.w    $0002
                dc.l    $F0070000, $0000FFF0
                dc.l    $F0070800, $08000000
Offset_0x036178:
                dc.w    $0002
                dc.l    $F0050008, $0004FFF8
                dc.l    $00051008, $1004FFF8
Offset_0x03618A:
                dc.w    $0002
                dc.l    $F001000C, $0006FFFC
                dc.l    $0001100C, $1006FFFC
Offset_0x03619C:
                dc.w    $0002
                dc.l    $F001080C, $0806FFFC
                dc.l    $0001180C, $1806FFFC
Offset_0x0361AE:
                dc.w    $0002
                dc.l    $F0050808, $0804FFF8
                dc.l    $00051808, $1804FFF8                                                                                                            
;===============================================================================
; Objeto 0xC1 - Parede que se destrói quando o jogador segura na Sky Fortress
; <<<- 
;===============================================================================