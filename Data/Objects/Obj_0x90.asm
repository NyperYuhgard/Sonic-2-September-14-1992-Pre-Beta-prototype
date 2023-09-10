;===============================================================================
; Objeto 0x90 -> Pedras espirrando quando o Grounder sai da parede na 
; ->>>           Neo Green Hill, carregado a partir do objeto 0x8D / 0x8E
;===============================================================================     
Offset_0x031026:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x031034(PC, D0), D1
                jmp     Offset_0x031034(PC, D1) 
;-------------------------------------------------------------------------------                      
Offset_0x031034:
                dc.w    Offset_0x031038-Offset_0x031034
                dc.w    Offset_0x03106E-Offset_0x031034  
;-------------------------------------------------------------------------------        
Offset_0x031038:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.w  #$4509, Obj_Art_VRAM(A0)                         ; $0002
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                move.b  Offset_0x031064(PC, D0), Obj_Speed(A0)           ; $0010
                move.b  Offset_0x031064+$01(PC, D0), Obj_Speed_Y(A0)     ; $0012
                lsr.w   #$01, D0
                move.b  Offset_0x03105E(PC, D0), Obj_Map_Id(A0)          ; $001A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608  
;-------------------------------------------------------------------------------
Offset_0x03105E:
                dc.b    $00, $02, $00, $01, $00, $00                            
;-------------------------------------------------------------------------------
Offset_0x031064:
                dc.b    $FF, $FC, $04, $FD, $02, $00, $FD, $FF
                dc.b    $FD, $FD                                                
;-------------------------------------------------------------------------------
Offset_0x03106E:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                bsr     Jmp_0B_To_ObjectFall                   ; Offset_0x037650
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x03107E:
                moveq   #$00, D1
                moveq   #$04, D6
Offset_0x031082:
                bsr     Jmp_10_To_SingleObjectLoad             ; Offset_0x037602
                bne.s   Offset_0x031090
                bsr     Offset_0x031092
                dbra    D6, Offset_0x031082
Offset_0x031090:
                rts
Offset_0x031092:
                move.b  #$90, Obj_Id(A1)                                 ; $0000
                move.b  #$06, Obj_Subtype(A1)                            ; $0028
                move.w  A0, Obj_Control_Var_00(A1)                       ; $002C
                move.w  D1, Obj_Control_Var_02(A1)                       ; $002E
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addq.w  #$02, D1
                rts
Offset_0x0310B6:
                moveq   #$00, D1
                moveq   #$03, D6
Offset_0x0310BA:
                bsr     Jmp_10_To_SingleObjectLoad             ; Offset_0x037602
                bne.s   Offset_0x0310C8
                bsr     Offset_0x0310CA
                dbra    D6, Offset_0x0310BA
Offset_0x0310C8:
                rts
Offset_0x0310CA:
                move.b  #$8F, Obj_Id(A1)                                 ; $0000
                move.b  #$04, Obj_Subtype(A1)                            ; $0028
                move.w  A0, Obj_Control_Var_00(A1)                       ; $002C
                move.w  D1, Obj_Control_Var_02(A1)                       ; $002E
                move.l  Obj_X(A0), D0                                    ; $0008
                swap.w  D0
                moveq   #$00, D2
                move.b  Offset_0x03110E(PC, D1), D2
                ext.w   D2
                add.w   D2, D0
                swap.w  D0
                move.l  D0, Obj_X(A1)                                    ; $0008
                move.l  Obj_Y(A0), D0                                    ; $000C
                swap.w  D0
                moveq   #$00, D2
                move.b  Offset_0x03110E+$01(PC, D1), D2
                ext.w   D2
                add.w   D2, D0
                swap.w  D0
                move.l  D0, Obj_Y(A1)                                    ; $000C
                addq.w  #$02, D1
                rts         
;-------------------------------------------------------------------------------        
Offset_0x03110E:
                dc.b    $00, $EC, $10, $FC, $00, $0C, $F0, $FC    
;-------------------------------------------------------------------------------  
Obj_0x8E_Ptr:                                                  ; Offset_0x031116
                dc.l    Grounder_Mappings                      ; Offset_0x031142
                dc.w    $A509
                dc.b    $04, $05, $10, $02   
;-------------------------------------------------------------------------------                        
Obj_0x8F_Ptr:                                                  ; Offset_0x031120
                dc.l    Grounder_Wall_Mappings                 ; Offset_0x031152
                dc.w    $0000
                dc.b    $84, $04, $10, $00   
;-------------------------------------------------------------------------------    
Obj_0x90_Ptr:                                                  ; Offset_0x03112A
                dc.l    Grounder_Rock_Mappings                 ; Offset_0x03114C
                dc.w    $A509
                dc.b    $84, $04, $08, $00   
;-------------------------------------------------------------------------------       
Grounder_AnimateData:                                          ; Offset_0x031134
                dc.w    Offset_0x031136-Grounder_AnimateData
;-------------------------------------------------------------------------------
Offset_0x031136:
                dc.b    $03, $02, $03, $04, $FF, $00       
;-------------------------------------------------------------------------------  
Grounder_AnimateData_01:                                       ; Offset_0x03113C
                dc.w    Offset_0x03113E-Grounder_AnimateData_01
Offset_0x03113E:
                dc.b    $07, $00, $01, $FC                         
;-------------------------------------------------------------------------------    
Grounder_Mappings:                                             ; Offset_0x031142
                dc.w    Offset_0x031154-Grounder_Mappings
                dc.w    Offset_0x031176-Grounder_Mappings
                dc.w    Offset_0x031198-Grounder_Mappings
                dc.w    Offset_0x0311AA-Grounder_Mappings
                dc.w    Offset_0x0311BC-Grounder_Mappings
Grounder_Rock_Mappings:                                        ; Offset_0x03114C
                dc.w    Offset_0x0311CE-Grounder_Rock_Mappings
                dc.w    Offset_0x0311D8-Grounder_Rock_Mappings
                dc.w    Offset_0x0311E2-Grounder_Rock_Mappings   
Grounder_Wall_Mappings:                                        ; Offset_0x031152
                dc.w    Offset_0x0311EC-Grounder_Wall_Mappings                         
Offset_0x031154:
                dc.w    $0004
                dc.l    $F4000000, $0000FFF8
                dc.l    $FC060001, $0000FFF0
                dc.l    $F4000800, $08000000
                dc.l    $FC060801, $08000000
Offset_0x031176:
                dc.w    $0004
                dc.l    $EC000007, $0003FFF8
                dc.l    $F4070008, $0004FFF0
                dc.l    $EC000807, $08030000
                dc.l    $F4070808, $08040000
Offset_0x031198:
                dc.w    $0002
                dc.l    $EC0F0010, $0008FFF0
                dc.l    $0C0C0020, $0010FFF0
Offset_0x0311AA:
                dc.w    $0002
                dc.l    $EC0F0010, $0008FFF0
                dc.l    $0C0C0024, $0012FFF0
Offset_0x0311BC:
                dc.w    $0002
                dc.l    $EC0F0010, $0008FFF0
                dc.l    $0C0C0028, $0014FFF0        
Offset_0x0311CE:
                dc.w    $0001
                dc.l    $F805002C, $0016FFF8
Offset_0x0311D8:
                dc.w    $0001
                dc.l    $FC000030, $0018FFFC
Offset_0x0311E2:
                dc.w    $0001
                dc.l    $FC000031, $0018FFFC      
Offset_0x0311EC:
                dc.w    $0002
                dc.l    $F8054093, $4049FFF0
                dc.l    $F8054097, $404B0000
;===============================================================================   
; Objeto 0x90 -> Pedras espirrando quando o Grounder sai da parede na 
; <<<-           Neo Green Hill, carregado a partir do objeto 0x8D / 0x8E
;===============================================================================