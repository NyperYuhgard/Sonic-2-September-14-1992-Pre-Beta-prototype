;===============================================================================
; Objeto 0x2B - Pilar que sobe quando se aproxima e pode ser destruído na
; ->>>          Neo Green Hill
;===============================================================================  
; Offset_0x020462:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x020470(PC, D0), D1
                jmp     Offset_0x020470(PC, D1)                     
;-------------------------------------------------------------------------------     
Offset_0x020470:
                dc.w    Offset_0x020476-Offset_0x020470
                dc.w    Offset_0x0204A4-Offset_0x020470
                dc.w    Offset_0x020594-Offset_0x020470    
;-------------------------------------------------------------------------------     
Offset_0x020476:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Raising_Pillar_Mappings, Obj_Map(A0) ; Offset_0x020674, $0004
                move.w  #$2000, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_11_To_ModifySpriteAttr_2P          ; Offset_0x020AF4
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$18, Obj_Height_2(A0)                           ; $0016
                move.b  #$04, Obj_Priority(A0)                           ; $0018  
;-------------------------------------------------------------------------------  
Offset_0x0204A4:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Offset_0x02052E
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  Obj_Height_2(A0), D2                             ; $0016
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  (A7)+, D4
                bsr     Jmp_05_To_SolidObject                  ; Offset_0x020AFA
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                bne     Offset_0x0204D6
                bra     Jmp_0E_To_MarkObjGone                  ; Offset_0x020AE8
Offset_0x0204D6:
                lea     (Offset_0x0205C4), A4
                lea     (Offset_0x0205B6), A2
                addq.b  #$07, Obj_Map_Id(A0)                             ; $001A
                bsr     Offset_0x0205FC
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                bsr.s   Offset_0x0204FC
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                addq.b  #$01, D6
                bra     Offset_0x020594
Offset_0x0204FC:
                bclr    D6, Obj_Status(A0)                               ; $0022
                beq.s   Offset_0x02052C
                bset    #$02, Obj_Status(A1)                             ; $0022
                move.b  #$0E, Obj_Height_2(A1)                           ; $0016
                move.b  #$07, Obj_Width_2(A1)                            ; $0017
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$02, Obj_Routine(A1)                            ; $0024
Offset_0x02052C:
                rts
Offset_0x02052E:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02053C(PC, D0), D1
                jmp     Offset_0x02053C(PC, D1)            
;-------------------------------------------------------------------------------       
Offset_0x02053C:
                dc.w    Offset_0x020542-Offset_0x02053C
                dc.w    Offset_0x02056C-Offset_0x02053C
                dc.w    Offset_0x02056A-Offset_0x02053C       
;-------------------------------------------------------------------------------     
Offset_0x020542:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne.s   Offset_0x02056A
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x020552
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
Offset_0x020552:
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_X(A1), D0                                    ; $0008
                bcc.s   Offset_0x02055E
                neg.w   D0
Offset_0x02055E:
                cmpi.w  #$0040, D0
                bcc.s   Offset_0x02056A
                move.b  #$02, Obj_Routine_2(A0)                          ; $0025 
;-------------------------------------------------------------------------------   
Offset_0x02056A:
                rts               
;-------------------------------------------------------------------------------   
Offset_0x02056C:
                subq.w  #$01, Obj_Control_Var_08(A0)                     ; $0034
                bcc.s   Offset_0x020592
                move.w  #$0003, Obj_Control_Var_08(A0)                   ; $0034
                subq.w  #$04, Obj_Y(A0)                                  ; $000C
                addq.b  #$04, Obj_Height_2(A0)                           ; $0016
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                cmpi.b  #$06, Obj_Map_Id(A0)                             ; $001A
                bne.s   Offset_0x020592
                move.b  #$04, Obj_Routine_2(A0)                          ; $0025
Offset_0x020592:
                rts   
;-------------------------------------------------------------------------------   
Offset_0x020594:
                tst.b   Obj_Control_Var_13(A0)                           ; $003F
                beq.s   Offset_0x0205A0
                subq.b  #$01, Obj_Control_Var_13(A0)                     ; $003F
                bra.s   Offset_0x0205AA
Offset_0x0205A0:
                bsr     Jmp_0A_To_SpeedToPos                   ; Offset_0x020B00
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
Offset_0x0205AA:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     Jmp_0D_To_DeleteObject                 ; Offset_0x020AE2
                bra     Jmp_09_To_DisplaySprite                ; Offset_0x020ADC             
;-------------------------------------------------------------------------------   
Offset_0x0205B6:
                dc.b    $00, $00, $00, $00, $04, $04, $08, $08
                dc.b    $0C, $0C, $10, $10, $14, $14
;-------------------------------------------------------------------------------
Offset_0x0205C4:
                dc.w    $FE00, $FE00, $0200, $FE00, $FE40, $FE40, $01C0, $FE40
                dc.w    $FE80, $FE80, $0180, $FE80, $FEC0, $FEC0, $0140, $FEC0
                dc.w    $FF00, $FF00, $0100, $FF00, $FF40, $FF40, $00C0, $FF40
                dc.w    $FF80, $FF80, $0080, $FF80  
;-------------------------------------------------------------------------------
Offset_0x0205FC:
                moveq   #$00, D0
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                add.w   D0, D0
                move.l  Obj_Map(A0), A3                                  ; $0004
                adda.w  $00(A3, D0), A3
                move.w  (A3)+, D1
                subq.w  #$01, D1
                bset    #$05, Obj_Flags(A0)                              ; $0001
                move.b  Obj_Id(A0), D4                                   ; $0000
                move.b  Obj_Flags(A0), D5                                ; $0001
                move.l  A0, A1
                bra.s   Offset_0x02062A      
;-------------------------------------------------------------------------------   
Offset_0x020622:
                bsr     Jmp_07_To_SingleObjectLoad_2           ; Offset_0x020AEE
                bne.s   Offset_0x02066A
                addq.w  #$08, A3
Offset_0x02062A:
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.b  D4, Obj_Id(A1)                                   ; $0000
                move.l  A3, Obj_Map(A1)                                  ; $0004
                move.b  D5, Obj_Flags(A1)                                ; $0001
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.b  Obj_Priority(A0), Obj_Priority(A1)        ; $0018, $0018
                move.b  Obj_Width(A0), Obj_Width(A1)              ; $0019, $0019
                move.w  (A4)+, Obj_Speed(A1)                             ; $0010
                move.w  (A4)+, Obj_Speed_Y(A1)                           ; $0012
                move.b  (A2)+, Obj_Control_Var_13(A1)                    ; $003F
                dbra    D1, Offset_0x020622
Offset_0x02066A:
                move.w  #$00CB, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912 
;-------------------------------------------------------------------------------  
Raising_Pillar_Mappings:                                       ; Offset_0x020674
                dc.w    Offset_0x020690-Raising_Pillar_Mappings
                dc.w    Offset_0x0206C2-Raising_Pillar_Mappings
                dc.w    Offset_0x0206FC-Raising_Pillar_Mappings
                dc.w    Offset_0x020736-Raising_Pillar_Mappings
                dc.w    Offset_0x020778-Raising_Pillar_Mappings
                dc.w    Offset_0x0207BA-Raising_Pillar_Mappings
                dc.w    Offset_0x020804-Raising_Pillar_Mappings
                dc.w    Offset_0x02084E-Raising_Pillar_Mappings
                dc.w    Offset_0x020890-Raising_Pillar_Mappings
                dc.w    Offset_0x0208E2-Raising_Pillar_Mappings
                dc.w    Offset_0x020934-Raising_Pillar_Mappings
                dc.w    Offset_0x020996-Raising_Pillar_Mappings
                dc.w    Offset_0x0209F8-Raising_Pillar_Mappings
                dc.w    Offset_0x020A6A-Raising_Pillar_Mappings
Offset_0x020690:
                dc.w    $0006
                dc.l    $100D208B, $2045FFF0
                dc.l    $E805005D, $002EFFE0
                dc.l    $E805085D, $082E0010
                dc.l    $E80D0061, $0030FFF0
                dc.l    $F80D0069, $0034FFF0
                dc.l    $080D0083, $0041FFF0
Offset_0x0206C2:
                dc.w    $0007
                dc.l    $140D208B, $2045FFF0
                dc.l    $E405005D, $002EFFE0
                dc.l    $E405085D, $082E0010
                dc.l    $E40D0061, $0030FFF0
                dc.l    $F40D0069, $0034FFF0
                dc.l    $FC0D0069, $0034FFF0
                dc.l    $0C0D0083, $0041FFF0
Offset_0x0206FC:
                dc.w    $0007
                dc.l    $180D208B, $2045FFF0
                dc.l    $E005005D, $002EFFE0
                dc.l    $E005085D, $082E0010
                dc.l    $E00D0061, $0030FFF0
                dc.l    $F00D0069, $0034FFF0
                dc.l    $000D0069, $0034FFF0
                dc.l    $100D0083, $0041FFF0
Offset_0x020736:
                dc.w    $0008
                dc.l    $1C0D208B, $2045FFF0
                dc.l    $DC05005D, $002EFFE0
                dc.l    $DC05085D, $082E0010
                dc.l    $DC0D0061, $0030FFF0
                dc.l    $EC0D0069, $0034FFF0
                dc.l    $FC0D0069, $0034FFF0
                dc.l    $040D0069, $0034FFF0
                dc.l    $140D0083, $0041FFF0
Offset_0x020778:
                dc.w    $0008
                dc.l    $200D208B, $2045FFF0
                dc.l    $D805005D, $002EFFE0
                dc.l    $D805085D, $082E0010
                dc.l    $D80D0061, $0030FFF0
                dc.l    $E80D0069, $0034FFF0
                dc.l    $F80D0069, $0034FFF0
                dc.l    $080D0069, $0034FFF0
                dc.l    $180D0083, $0041FFF0
Offset_0x0207BA:
                dc.w    $0009
                dc.l    $240D208B, $2045FFF0
                dc.l    $D405005D, $002EFFE0
                dc.l    $D405085D, $082E0010
                dc.l    $D40D0061, $0030FFF0
                dc.l    $E40D0069, $0034FFF0
                dc.l    $F40D0069, $0034FFF0
                dc.l    $040D0069, $0034FFF0
                dc.l    $0C0D0069, $0034FFF0
                dc.l    $1C0D0083, $0041FFF0
Offset_0x020804:
                dc.w    $0009
                dc.l    $280D208B, $2045FFF0
                dc.l    $D005005D, $002EFFE0
                dc.l    $D005085D, $082E0010
                dc.l    $D00D0061, $0030FFF0
                dc.l    $E00D0069, $0034FFF0
                dc.l    $F00D0069, $0034FFF0
                dc.l    $000D0069, $0034FFF0
                dc.l    $100D0069, $0034FFF0
                dc.l    $200D0083, $0041FFF0
Offset_0x02084E:
                dc.w    $0008
                dc.l    $E805005D, $002EFFE0
                dc.l    $E805085D, $082E0010
                dc.l    $E8050061, $0030FFF0
                dc.l    $E8050065, $00320000
                dc.l    $F8050069, $0034FFF0
                dc.l    $F805006D, $00360000
                dc.l    $08050083, $0041FFF0
                dc.l    $08050087, $00430000
Offset_0x020890:
                dc.w    $000A
                dc.l    $E405005D, $002EFFE0
                dc.l    $E405085D, $082E0010
                dc.l    $E4050061, $0030FFF0
                dc.l    $E4050065, $00320000
                dc.l    $F4050069, $0034FFF0
                dc.l    $F405006D, $00360000
                dc.l    $FC050069, $0034FFF0
                dc.l    $FC05006D, $00360000
                dc.l    $0C050083, $0041FFF0
                dc.l    $0C050087, $00430000
Offset_0x0208E2:
                dc.w    $000A
                dc.l    $E005005D, $002EFFE0
                dc.l    $E005085D, $082E0010
                dc.l    $E0050061, $0030FFF0
                dc.l    $E0050065, $00320000
                dc.l    $F0050069, $0034FFF0
                dc.l    $F005006D, $00360000
                dc.l    $00050069, $0034FFF0
                dc.l    $0005006D, $00360000
                dc.l    $10050083, $0041FFF0
                dc.l    $10050087, $00430000
Offset_0x020934:
                dc.w    $000C
                dc.l    $DC05005D, $002EFFE0
                dc.l    $DC05085D, $082E0010
                dc.l    $DC050061, $0030FFF0
                dc.l    $DC050065, $00320000
                dc.l    $EC050069, $0034FFF0
                dc.l    $EC05006D, $00360000
                dc.l    $FC050069, $0034FFF0
                dc.l    $FC05006D, $00360000
                dc.l    $04050069, $0034FFF0
                dc.l    $0405006D, $00360000
                dc.l    $14050083, $0041FFF0
                dc.l    $14050087, $00430000
Offset_0x020996:
                dc.w    $000C
                dc.l    $D805005D, $002EFFE0
                dc.l    $D805085D, $082E0010
                dc.l    $D8050061, $0030FFF0
                dc.l    $D8050065, $00320000
                dc.l    $E8050069, $0034FFF0
                dc.l    $E805006D, $00360000
                dc.l    $F8050069, $0034FFF0
                dc.l    $F805006D, $00360000
                dc.l    $08050069, $0034FFF0
                dc.l    $0805006D, $00360000
                dc.l    $18050083, $0041FFF0
                dc.l    $18050087, $00430000
Offset_0x0209F8:
                dc.w    $000E
                dc.l    $D405005D, $002EFFE0
                dc.l    $D405085D, $082E0010
                dc.l    $D4050061, $0030FFF0
                dc.l    $D4050065, $00320000
                dc.l    $E4050069, $0034FFF0
                dc.l    $E405006D, $00360000
                dc.l    $F4050069, $0034FFF0
                dc.l    $F405006D, $00360000
                dc.l    $04050069, $0034FFF0
                dc.l    $0405006D, $00360000
                dc.l    $0C050069, $0034FFF0
                dc.l    $0C05006D, $00360000
                dc.l    $1C050083, $0041FFF0
                dc.l    $1C050087, $00430000
Offset_0x020A6A:
                dc.w    $000E
                dc.l    $D005005D, $002EFFE0
                dc.l    $D005085D, $082E0010
                dc.l    $D0050061, $0030FFF0
                dc.l    $D0050065, $00320000
                dc.l    $E0050069, $0034FFF0
                dc.l    $E005006D, $00360000
                dc.l    $F0050069, $0034FFF0
                dc.l    $F005006D, $00360000
                dc.l    $00050069, $0034FFF0
                dc.l    $0005006D, $00360000
                dc.l    $10050069, $0034FFF0
                dc.l    $1005006D, $00360000
                dc.l    $20050083, $0041FFF0
                dc.l    $20050087, $00430000
;===============================================================================   
; Objeto 0x2B - Pilar que sobe quando se aproxima e pode ser destruído na
; <<<-          Neo Green Hill
;===============================================================================