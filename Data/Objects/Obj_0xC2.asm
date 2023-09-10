;===============================================================================
; Objeto 0xC2 - Botão para acesso a cabine do avião com chefe na Sky Fortress
; ->>> 
;===============================================================================
; Offset_0x0361C0:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0361CE(PC, D0), D1
                jmp     Offset_0x0361CE(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x0361CE:
                dc.w    Offset_0x0361D2-Offset_0x0361CE
                dc.w    Offset_0x0361D6-Offset_0x0361CE           
;-------------------------------------------------------------------------------
Offset_0x0361D2:
                bra     Object_Settings                        ; Offset_0x030A30
Offset_0x0361D6:
                move.b  ($FFFFB01C).w, Obj_Control_Var_04(A0)            ; $0030
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
                move.w  (A7)+, D4
                bsr     Jmp_19_To_SolidObject                  ; Offset_0x03764A
                bclr    #$03, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x0361FE
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0361FE:
                cmpi.b  #$02, Obj_Control_Var_04(A0)                     ; $0030
                bne.s   Offset_0x036240
                move.b  #$27, Obj_Id(A0)                                 ; $0000
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                bset    #$01, ($FFFFB022).w
                bclr    #$03, ($FFFFB022).w
                lea     (Level_Map_Buffer+$0850).w, A1               ; $FFFF8850
                move.l  #$8A707172, (A1)+
                move.w  #$7374, (A1)+
                lea     (Level_Map_Buffer+$0950).w, A1               ; $FFFF8950
                move.l  #$6E787978, (A1)+
                move.w  #$787A, (A1)+
                move.b  #$01, (Refresh_Level_Layout).w               ; $FFFFF72C
Offset_0x036240:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608  
;-------------------------------------------------------------------------------
Obj_0xC2_Ptr:                                                  ; Offset_0x036244
                dc.l    SFz_Boss_Access_Switch_Mappings        ; Offset_0x03624E
                dc.w    $A469
                dc.b    $04, $04, $10, $00   
;-------------------------------------------------------------------------------    
SFz_Boss_Access_Switch_Mappings:                               ; Offset_0x03624E
                dc.w    Offset_0x036250-SFz_Boss_Access_Switch_Mappings
Offset_0x036250:
                dc.w    $0002
                dc.l    $F8050000, $0000FFF0
                dc.l    $F8050800, $08000000                                            
;===============================================================================
; Objeto 0xC2 - Botão para acesso a cabine do avião com chefe na Sky Fortress
; <<<- 
;===============================================================================