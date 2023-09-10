;===============================================================================
; Objeto 0x0B - Plataforma tipo armadilha na Chemical Plant
; ->>>        
;===============================================================================  
; Offset_0x01AB40:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01AB4E(PC, D0), D1
                jmp     Offset_0x01AB4E(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x01AB4E:
                dc.w    Offset_0x01AB54-Offset_0x01AB4E
                dc.w    Offset_0x01ABA8-Offset_0x01AB4E
                dc.w    Offset_0x01ABB6-Offset_0x01AB4E          
;-------------------------------------------------------------------------------  
Offset_0x01AB54:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Open_Close_Platform_Mappings, Obj_Map(A0) ; Offset_0x01AC2A, $0004
                move.w  #$E3B0, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_00_To_ModifySpriteAttr_2P          ; Offset_0x01AC96
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$00F0, D0
                addi.w  #$0010, D0
                move.w  D0, D1
                subq.w  #$01, D0
                move.w  D0, Obj_Control_Var_04(A0)                       ; $0030
                move.w  D0, Obj_Control_Var_06(A0)                       ; $0032
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$000F, D0
                addq.w  #$01, D0
                lsl.w   #$04, D0
                move.b  D0, Obj_Control_Var_0A(A0)                       ; $0036  
;-------------------------------------------------------------------------------  
Offset_0x01ABA8:       
                move.b  ($FFFFFE0F).w, D0
                add.b   Obj_Control_Var_0A(A0), D0                       ; $0036
                bne.s   Offset_0x01ABE0
                addq.b  #$02, Obj_Routine(A0)                            ; $0024 
;-------------------------------------------------------------------------------  
Offset_0x01ABB6:         
                subq.w  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bpl.s   Offset_0x01ABD4
                move.w  #$007F, Obj_Control_Var_04(A0)                   ; $0030
                tst.b   Obj_Ani_Number(A0)                               ; $001C
                beq.s   Offset_0x01ABCE
                move.w  Obj_Control_Var_06(A0), Obj_Control_Var_04(A0); $0030, $0032
Offset_0x01ABCE:
                bchg    #00, Obj_Ani_Number(A0)                          ; $001C
Offset_0x01ABD4:
                lea     (Open_Close_Platform_Animate_Data), A1 ; Offset_0x01AC16
                jsr     (AnimateSprite)                        ; Offset_0x01212E
Offset_0x01ABE0:
                tst.b   Obj_Map_Id(A0)                                   ; $001A
                bne.s   Offset_0x01ABFA
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                moveq   #$11, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Platform_Object                        ; Offset_0x014D02
                bra     Jmp_01_To_MarkObjGone                  ; Offset_0x01AC90
Offset_0x01ABFA:
                btst    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01AC12
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bclr    #$03, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A0)                             ; $0022
Offset_0x01AC12:
                bra     Jmp_01_To_MarkObjGone                  ; Offset_0x01AC90     
;-------------------------------------------------------------------------------
Open_Close_Platform_Animate_Data:                              ; Offset_0x01AC16
                dc.w    Offset_0x01AC1A-Open_Close_Platform_Animate_Data
                dc.w    Offset_0x01AC22-Open_Close_Platform_Animate_Data
Offset_0x01AC1A:
                dc.b    $07, $00, $01, $02, $03, $04, $FE, $01
Offset_0x01AC22:
                dc.b    $07, $04, $03, $02, $01, $00, $FE, $01   
;-------------------------------------------------------------------------------
Open_Close_Platform_Mappings:                                  ; Offset_0x01AC2A
                dc.w    Offset_0x01AC34-Open_Close_Platform_Mappings
                dc.w    Offset_0x01AC46-Open_Close_Platform_Mappings
                dc.w    Offset_0x01AC58-Open_Close_Platform_Mappings
                dc.w    Offset_0x01AC6A-Open_Close_Platform_Mappings
                dc.w    Offset_0x01AC7C-Open_Close_Platform_Mappings
Offset_0x01AC34:
                dc.w    $0002
                dc.l    $F00C0000, $0000FFF0
                dc.l    $F80E0024, $0012FFF0
Offset_0x01AC46:
                dc.w    $0002
                dc.l    $E80F0004, $0002FFF0
                dc.l    $F80E0024, $0012FFF0
Offset_0x01AC58:
                dc.w    $0002
                dc.l    $F40F0014, $000AFFF0
                dc.l    $F80E0024, $0012FFF0
Offset_0x01AC6A:
                dc.w    $0002
                dc.l    $000F1004, $1002FFF0
                dc.l    $F80E0024, $0012FFF0
Offset_0x01AC7C:
                dc.w    $0002
                dc.l    $100C1000, $1000FFF0
                dc.l    $F80E0024, $0012FFF0                                                
;===============================================================================   
; Objeto 0x0B - Plataforma tipo armadilha na Chemical Plant
; <<<-        
;===============================================================================