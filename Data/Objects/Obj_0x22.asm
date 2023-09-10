;===============================================================================
; Objeto 0x22 - Atirador de setas na Neo Green Hill
; ->>> 
;===============================================================================
; Offset_0x02009C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0200AA(PC, D0), D1
                jmp     Offset_0x0200AA(PC, D1)       
;-------------------------------------------------------------------------------   
Offset_0x0200AA:
                dc.w    Offset_0x0200B4-Offset_0x0200AA
                dc.w    Offset_0x0200E8-Offset_0x0200AA
                dc.w    Offset_0x020132-Offset_0x0200AA
                dc.w    Offset_0x020182-Offset_0x0200AA
                dc.w    Offset_0x0201C6-Offset_0x0200AA        
;-------------------------------------------------------------------------------  
Offset_0x0200B4:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Arrow_Shooter_Mappings, Obj_Map(A0) ; Offset_0x02020C, $0004
                move.w  #$0417, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_10_To_ModifySpriteAttr_2P          ; Offset_0x020288
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                andi.b  #$0F, Obj_Subtype(A0)                            ; $0028    
;-------------------------------------------------------------------------------  
Offset_0x0200E8:
                cmpi.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                beq.s   Offset_0x02010E
                moveq   #$00, D2
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x02011C
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr.s   Offset_0x02011C
                tst.b   D2
                bne.s   Offset_0x02010A
                tst.b   Obj_Ani_Number(A0)                               ; $001C
                beq.s   Offset_0x02010A
                moveq   #$02, D2
Offset_0x02010A:
                move.b  D2, Obj_Ani_Number(A0)                           ; $001C
Offset_0x02010E:
                lea     (Arrow_Shooter_Animate_Data), A1       ; Offset_0x0201F6
                bsr     Jmp_02_To_AnimateSprite                ; Offset_0x020282
                bra     Jmp_0D_To_MarkObjGone                  ; Offset_0x02027C
Offset_0x02011C:
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_X(A1), D0                                    ; $0008
                bcc.s   Offset_0x020128
                neg.w   D0
Offset_0x020128:
                cmpi.w  #$0040, D0
                bcc.s   Offset_0x020130
                moveq   #$01, D2
Offset_0x020130:
                rts        
;-------------------------------------------------------------------------------  
Offset_0x020132:
                bsr     Jmp_02_To_SingleObjectLoad             ; Offset_0x020276
                bne.s   Offset_0x020170
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                addq.b  #$06, Obj_Routine(A1)                            ; $0024
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                move.b  Obj_Status(A0), Obj_Status(A1)            ; $0022, $0022
                move.w  #$00DB, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x020170:
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
                lea     (Arrow_Shooter_Animate_Data), A1       ; Offset_0x0201F6
                bsr     Jmp_02_To_AnimateSprite                ; Offset_0x020282
                bra     Jmp_0D_To_MarkObjGone                  ; Offset_0x02027C     
;-------------------------------------------------------------------------------  
Offset_0x020182:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$08, Obj_Height_2(A0)                           ; $0016
                move.b  #$10, Obj_Width_2(A0)                            ; $0017
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$9B, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                move.w  #$0400, Obj_Speed(A0)                            ; $0010
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x0201BC
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x0201BC:
                move.w  #$00AE, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912  
;-------------------------------------------------------------------------------  
Offset_0x0201C6:
                bsr     Jmp_09_To_SpeedToPos                   ; Offset_0x02028E
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x0201E6
                moveq   #-$08, D3
                bsr     Object_HitWall_Left                    ; Offset_0x019E00
                tst.w   D1
                bmi     Offset_0x0201E2
                bra     Jmp_0D_To_MarkObjGone                  ; Offset_0x02027C
Offset_0x0201E2:
                bra     Jmp_0C_To_DeleteObject                 ; Offset_0x020270
Offset_0x0201E6:
                moveq   #$08, D3
                bsr     Object_HitWall_Right                   ; Offset_0x019C7A
                tst.w   D1
                bmi     Offset_0x0201E2
                bra     Jmp_0D_To_MarkObjGone                  ; Offset_0x02027C              
;-------------------------------------------------------------------------------  
Arrow_Shooter_Animate_Data:                                    ; Offset_0x0201F6
                dc.w    Offset_0x0201FC-Arrow_Shooter_Animate_Data
                dc.w    Offset_0x0201FF-Arrow_Shooter_Animate_Data
                dc.w    Offset_0x020203-Arrow_Shooter_Animate_Data
Offset_0x0201FC:
                dc.b    $1F, $01, $FF
Offset_0x0201FF:
                dc.b    $03, $01, $02, $FF
Offset_0x020203:
                dc.b    $07, $03, $04, $FC, $04, $03, $01, $FD
                dc.b    $00                                       
;-------------------------------------------------------------------------------
Arrow_Shooter_Mappings:                                        ; Offset_0x02020C
                dc.w    Offset_0x020216-Arrow_Shooter_Mappings
                dc.w    Offset_0x020220-Arrow_Shooter_Mappings
                dc.w    Offset_0x020232-Arrow_Shooter_Mappings
                dc.w    Offset_0x02024C-Arrow_Shooter_Mappings
                dc.w    Offset_0x02025E-Arrow_Shooter_Mappings
Offset_0x020216:
                dc.w    $0001
                dc.l    $FC0C2000, $2000FFF0
Offset_0x020220:
                dc.w    $0002
                dc.l    $F8092004, $2002FFF0
                dc.l    $F801200B, $20050008
Offset_0x020232:
                dc.w    $0003
                dc.l    $FC00000A, $0005FFFC
                dc.l    $F8092004, $2002FFF0
                dc.l    $F801200B, $20050008
Offset_0x02024C:
                dc.w    $0002
                dc.l    $F8092004, $2002FFF0
                dc.l    $F801200D, $20060008
Offset_0x02025E:
                dc.w    $0002
                dc.l    $F8092004, $2002FFF0
                dc.l    $F801200F, $20070008
;===============================================================================
; Objeto 0x22 - Atirador de setas na Neo Green Hill
; <<<- 
;===============================================================================