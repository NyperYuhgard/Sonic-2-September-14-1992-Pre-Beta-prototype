;===============================================================================
; Objeto 0x36 - Espinhos
; ->>>        
;===============================================================================                          
Offset_0x011524:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x011532(PC, D0), D1
                jmp     Offset_0x011532(PC, D1)
Offset_0x011532:                
                dc.w    Offset_0x01154A-Offset_0x011532
                dc.w    Offset_0x0115B6-Offset_0x011532
                dc.w    Offset_0x011606-Offset_0x011532
                dc.w    Offset_0x011662-Offset_0x011532
Spikes_Conf:                                                   ; Offset_0x01153A
                dc.b    $10, $10  ; Largura / Altura do espinho
                dc.b    $20, $10
                dc.b    $30, $10
                dc.b    $40, $10
                dc.b    $10, $10
                dc.b    $10, $20
                dc.b    $10, $30
                dc.b    $10, $40
Offset_0x01154A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Spikes_Mappings, Obj_Map(A0)   ; Offset_0x011782, $0004
                move.w  #$2434, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.b  #$0F, Obj_Subtype(A0)                            ; $0028
                andi.w  #$00F0, D0
                lea     Spikes_Conf(PC), A1                    ; Offset_0x01153A
                lsr.w   #$03, D0
                adda.w  D0, A1
                move.b  (A1)+, Obj_Width(A0)                             ; $0019
                move.b  (A1)+, Obj_Height_2(A0)                          ; $0016
                lsr.w   #$01, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                cmpi.b  #$04, D0
                bcs.s   Offset_0x01159A
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x01159A:
                btst    #$01, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x0115A8
                move.b  #$06, Obj_Routine(A0)                            ; $0024
Offset_0x0115A8:
                move.w  Obj_X(A0), $0030(A0)                             ; $0008
                move.w  Obj_Y(A0), $0032(A0)                             ; $000C
                rts        
Offset_0x0115B6:
                bsr     Offset_0x0116E0
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  Obj_Height_2(A0), D2                             ; $0016
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     SolidObject                            ; Offset_0x0147F4
                move.b  Obj_Status(A0), D6                               ; $0022
                andi.b  #$18, D6
                beq.s   Offset_0x0115FE
                move.b  D6, D0
                andi.b  #$08, D0
                beq.s   Offset_0x0115F0
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr     Hurt_Player_A1                         ; Offset_0x0116B0
Offset_0x0115F0:
                andi.b  #$10, D6
                beq.s   Offset_0x0115FE
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr     Hurt_Player_A1                         ; Offset_0x0116B0
Offset_0x0115FE:
                move.w  $0030(A0), D0
                bra     MarkObjGone_2                          ; Offset_0x011FF4    
Offset_0x011606:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Offset_0x0116E0
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  Obj_Height_2(A0), D2                             ; $0016
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  (A7)+, D4
                bsr     SolidObject                            ; Offset_0x0147F4
                swap.w  D6
                andi.w  #$0003, D6
                beq.s   Offset_0x01165A
                move.b  D6, D0
                andi.b  #$01, D0
                beq.s   Offset_0x011646
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr     Hurt_Player_A1                         ; Offset_0x0116B0
                bclr    #$05, Obj_Status(A0)                             ; $0022
Offset_0x011646:
                andi.b  #$02, D6
                beq.s   Offset_0x01165A
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr     Hurt_Player_A1                         ; Offset_0x0116B0
                bclr    #$06, Obj_Status(A0)                             ; $0022
Offset_0x01165A:
                move.w  $0030(A0), D0
                bra     MarkObjGone_2                          ; Offset_0x011FF4   
Offset_0x011662:
                bsr     Offset_0x0116E0
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  Obj_Height_2(A0), D2                             ; $0016
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     SolidObject                            ; Offset_0x0147F4
                swap.w  D6
                andi.w  #$000C, D6
                beq.s   Offset_0x0116A8
                move.b  D6, D0
                andi.b  #$04, D0
                beq.s   Offset_0x01169A
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr     Hurt_Player_A1                         ; Offset_0x0116B0
Offset_0x01169A:
                andi.b  #$08, D6
                beq.s   Offset_0x0116A8
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr     Hurt_Player_A1                         ; Offset_0x0116B0
Offset_0x0116A8:
                move.w  $0030(A0), D0
                bra     MarkObjGone_2                          ; Offset_0x011FF4
;-------------------------------------------------------------------------------                
Hurt_Player_A1:                                                ; Offset_0x0116B0
                btst    #$01, Obj_Player_Status(A1)                      ; $002B
                bne.s   Exit_Hurt_Player_A1                    ; Offset_0x0116DE
                cmpi.b  #$04, Obj_Routine(A1)                            ; $0024
                bcc.s   Exit_Hurt_Player_A1                    ; Offset_0x0116DE
                move.l  Obj_Y(A1), D3                                    ; $000C
                move.w  Obj_Speed_Y(A1), D0                              ; $0012
                ext.l   D0
                asl.l   #$08, D0
                sub.l   D0, D3
                move.l  D3, Obj_Y(A1)                                    ; $000C
                move.l  A0, A2
                move.l  A1, A0
                jsr     (Hurt_Player)                          ; Offset_0x038374
                move.l  A2, A0
Exit_Hurt_Player_A1:                                           ; Offset_0x0116DE
                rts
;-------------------------------------------------------------------------------                  
Offset_0x0116E0:
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                add.w   D0, D0
                move.w  Offset_0x0116F0(PC, D0), D1
                jmp     Offset_0x0116F0(PC, D1)        
Offset_0x0116F0:                                         
                dc.w    Offset_0x0116F6-Offset_0x0116F0
                dc.w    Offset_0x0116F8-Offset_0x0116F0
                dc.w    Offset_0x01170C-Offset_0x0116F0             
Offset_0x0116F6:
                rts
Offset_0x0116F8:
                bsr     Offset_0x011720
                moveq   #$00, D0
                move.b  $0034(A0), D0
                add.w   $0032(A0), D0
                move.w  D0, Obj_Y(A0)                                    ; $000C
                rts
Offset_0x01170C:
                bsr     Offset_0x011720
                moveq   #$00, D0
                move.b  $0034(A0), D0
                add.w   $0030(A0), D0
                move.w  D0, Obj_X(A0)                                    ; $0008
                rts
Offset_0x011720:
                tst.w   $0038(A0)
                beq.s   Offset_0x01173E
                subq.w  #$01, $0038(A0)
                bne.s   Offset_0x011780
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x011780
                move.w  #$00B6, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                bra.s   Offset_0x011780
Offset_0x01173E:
                tst.w   $0036(A0)
                beq.s   Offset_0x011760
                subi.w  #$0800, $0034(A0)
                bcc.s   Offset_0x011780
                move.w  #$0000, $0034(A0)
                move.w  #$0000, $0036(A0)
                move.w  #$003C, $0038(A0)
                bra.s   Offset_0x011780
Offset_0x011760:
                addi.w  #$0800, $0034(A0)
                cmpi.w  #$2000, $0034(A0)
                bcs.s   Offset_0x011780
                move.w  #$2000, $0034(A0)
                move.w  #$0001, $0036(A0)
                move.w  #$003C, $0038(A0)
Offset_0x011780:
                rts
;-------------------------------------------------------------------------------
Spikes_Mappings:                                               ; Offset_0x011782      
                dc.w    Offset_0x011792-Spikes_Mappings
                dc.w    Offset_0x0117A4-Spikes_Mappings
                dc.w    Offset_0x0117C6-Spikes_Mappings
                dc.w    Offset_0x0117F8-Spikes_Mappings
                dc.w    Offset_0x01183A-Spikes_Mappings
                dc.w    Offset_0x01184C-Spikes_Mappings
                dc.w    Offset_0x01186E-Spikes_Mappings
                dc.w    Offset_0x0118A0-Spikes_Mappings
Offset_0x011792:
                dc.w    $0002
                dc.l    $F0070000, $0000FFF0, $F0070000, $00000000
Offset_0x0117A4:
                dc.w    $0004
                dc.l    $F0070000, $0000FFE0, $F0070000, $0000FFF0
                dc.l    $F0070000, $00000000, $F0070000, $00000010
Offset_0x0117C6:
                dc.w    $0006
                dc.l    $F0070000, $0000FFD0, $F0070000, $0000FFE0
                dc.l    $F0070000, $0000FFF0, $F0070000, $00000000
                dc.l    $F0070000, $00000010, $F0070000, $00000020
Offset_0x0117F8:
                dc.w    $0008
                dc.l    $F0070000, $0000FFC0, $F0070000, $0000FFD0
                dc.l    $F0070000, $0000FFE0, $F0070000, $0000FFF0
                dc.l    $F0070000, $00000000, $F0070000, $00000010
                dc.l    $F0070000, $00000020, $F0070000, $00000030
Offset_0x01183A:
                dc.w    $0002
                dc.l    $F00DFFF8, $FBFCFFF0, $000DFFF8, $FBFCFFF0
Offset_0x01184C:
                dc.w    $0004
                dc.l    $E00DFFF8, $FBFCFFF0, $F00DFFF8, $FBFCFFF0
                dc.l    $000DFFF8, $FBFCFFF0, $100DFFF8, $FBFCFFF0
Offset_0x01186E:
                dc.w    $0006
                dc.l    $D00DFFF8, $FBFCFFF0, $E00DFFF8, $FBFCFFF0
                dc.l    $F00DFFF8, $FBFCFFF0, $000DFFF8, $FBFCFFF0
                dc.l    $100DFFF8, $FBFCFFF0, $200DFFF8, $FBFCFFF0
Offset_0x0118A0:
                dc.w    $0008
                dc.l    $C00DFFF8, $FBFCFFF0, $D00DFFF8, $FBFCFFF0
                dc.l    $E00DFFF8, $FBFCFFF0, $F00DFFF8, $FBFCFFF0
                dc.l    $000DFFF8, $FBFCFFF0, $100DFFF8, $FBFCFFF0
                dc.l    $200DFFF8, $FBFCFFF0, $300DFFF8, $FBFCFFF0
;===============================================================================
; Objeto 0x36 - Espinhos
; <<<-        
;===============================================================================