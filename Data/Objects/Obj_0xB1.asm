;===============================================================================
; Objeto 0xB1 - Sonic correndo na tela SEGA
; ->>> 
;===============================================================================
; Offset_0x034766:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x034774(PC, D0), D1
                jmp     Offset_0x034774(PC, D1)
;-------------------------------------------------------------------------------                 
Offset_0x034774:                         
                dc.w    Offset_0x034778-Offset_0x034774
                dc.w    Offset_0x034790-Offset_0x034774
;-------------------------------------------------------------------------------  
Offset_0x034778:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
                move.w  #$0174, Obj_X(A0)                                ; $0008
                move.w  #$00D8, Obj_Sub_Y(A0)                            ; $000A
                rts
;-------------------------------------------------------------------------------                  
Offset_0x034790:
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x034794:
                lea     ($FFFFE138).w, A1
                move.w  #$0022, D6
Offset_0x03479C:
                subi.w  #$0020, (A1)
                addq.w  #$08, A1
                dbra    D6, Offset_0x03479C
                rts
Offset_0x0347A8:
                lea     ($FFFFE13C).w, A1
                move.w  #$0022, D6
Offset_0x0347B0:
                addi.w  #$0020, (A1)
                addq.w  #$08, A1
                dbra    D6, Offset_0x0347B0
                rts
Offset_0x0347BC:
                subq.b  #$01, $002C(A0)
                bne.s   Offset_0x034804
                moveq   #$00, D0
                move.b  $002D(A0), D0
                addq.b  #$01, D0
                cmp.b   Obj_Flags(A1), D0                                ; $0001
                bcs.s   Offset_0x0347D6
                tst.b   $0003(A1)
                bne.s   Offset_0x034808
Offset_0x0347D6:
                move.b  D0, $002D(A0)
                move.b  Obj_Id(A1), $002C(A0)                            ; $0000
                lea     $0006(A1), A2
                moveq   #$00, D1
                move.b  Obj_Art_VRAM(A1), D1                             ; $0002
                move.w  D1, D2
                tst.w   D0
                beq.s   Offset_0x0347FA
Offset_0x0347F0:
                subq.b  #$01, D0
                beq.s   Offset_0x0347F8
                add.w   D2, D1
                bra.s   Offset_0x0347F0
Offset_0x0347F8:
                adda.w  D1, A2
Offset_0x0347FA:
                move.w  Obj_Map(A1), A3                                  ; $0004
Offset_0x0347FE:
                move.w  (A2)+, (A3)+
                subq.w  #$02, D2
                bne.s   Offset_0x0347FE
Offset_0x034804:
                moveq   #$00, D0
                rts
Offset_0x034808:
                moveq   #$01, D0
                rts   
;-------------------------------------------------------------------------------
Offset_0x03480C:
                dc.b    $04, $07, $10, $FF
                dc.w    $FB10                  
                dc.w    $0E60, $0E60, $0E60, $0E60, $0E60, $0E60, $0E60, $0EEE
                dc.w    $0E62, $0EEE, $0EEE, $0EEE, $0EEE, $0EEE, $0EEE, $0EEE
                dc.w    $0E84, $0E62, $0E60, $0E60, $0E60, $0E60, $0E60, $0EEE
                dc.w    $0EA6, $0E84, $0E62, $0E60, $0E60, $0E60, $0E60, $0EEE
                dc.w    $0EC8, $0EA6, $0E84, $0E62, $0E60, $0E60, $0E60, $0EEE
                dc.w    $0EEC, $0EC8, $0EA6, $0E84, $0E62, $0E60, $0E60, $0EEE
                dc.w    $0EEE, $0EEC, $0EC8, $0EA6, $0E84, $0E62, $0E60, $0EEE    
;-------------------------------------------------------------------------------
Offset_0x034882:
                dc.b    $04, $07, $10, $FF
                dc.w    $FB00                    
                dc.w    $0EEE, $0E60, $0E60, $0E60, $0E60, $0E60, $0E60, $0E60
                dc.w    $0EEE, $0E62, $0E60, $0E60, $0E60, $0E60, $0E60, $0E60
                dc.w    $0EEE, $0E84, $0E62, $0E60, $0E60, $0E60, $0E60, $0E60
                dc.w    $0EEE, $0EA6, $0E84, $0E62, $0E60, $0E60, $0E60, $0E60
                dc.w    $0EEE, $0EC8, $0EA6, $0E84, $0E62, $0E60, $0E60, $0E60
                dc.w    $0EEE, $0EEC, $0EC8, $0EA6, $0E84, $0E62, $0E60, $0E60
                dc.w    $0EEE, $0EEE, $0EEC, $0EC8, $0EA6, $0E84, $0E62, $0E60 
;-------------------------------------------------------------------------------
Obj_0xB0_Ptr:                                                  ; Offset_0x0348F8 
                dc.l    Sonic_Sega_Logo_Mappings               ; Offset_0x034914
                dc.w    $C088
                dc.b    $00, $01, $10, $00
;-------------------------------------------------------------------------------
Obj_0xB1_Ptr:                                                  ; Offset_0x034902
                dc.l    Sonic_Sega_Logo_Mappings               ; Offset_0x034914
                dc.w    $0003, $0002                  
                dc.b    $08, $00   
;-------------------------------------------------------------------------------
Sonic_Sega_Logo_Animate_Data:                                  ; Offset_0x03490C   
                dc.w    Offset_0x03490E-Sonic_Sega_Logo_Animate_Data
Offset_0x03490E:
                dc.b    $00, $00, $01, $02, $03, $FF
;-------------------------------------------------------------------------------   
Sonic_Sega_Logo_Mappings:                                      ; Offset_0x034914    
                dc.w    Offset_0x03491E-Sonic_Sega_Logo_Mappings
                dc.w    Offset_0x034950-Sonic_Sega_Logo_Mappings
                dc.w    Offset_0x034982-Sonic_Sega_Logo_Mappings
                dc.w    Offset_0x0349B4-Sonic_Sega_Logo_Mappings
                dc.w    Offset_0x0349E6-Sonic_Sega_Logo_Mappings
Offset_0x03491E:
                dc.w    $0006
                dc.l    $D80F0000, $0000FFF0, $D8070010, $00080010
                dc.l    $F80F0018, $000CFFE0, $180F0028, $0014FFE0
                dc.l    $F80F0038, $001C0000, $180F0048, $00240000
Offset_0x034950:
                dc.w    $0006
                dc.l    $D80F0058, $002CFFF0, $D8070068, $00340010
                dc.l    $F80F0070, $0038FFE0, $180F0080, $0040FFE0
                dc.l    $F80F0090, $00480000, $180F00A0, $00500000
Offset_0x034982:
                dc.w    $0006
                dc.l    $D80F00B0, $0058FFF0, $D80700C0, $00600010
                dc.l    $F80F00C8, $0064FFE0, $180F00D8, $006CFFE0
                dc.l    $F80F00E8, $00740000, $180F00F8, $007C0000
Offset_0x0349B4:
                dc.w    $0006
                dc.l    $D80F0108, $0084FFF0, $D8070118, $008C0010
                dc.l    $F80F0120, $0090FFE0, $180F0130, $0098FFE0
                dc.l    $F80F0140, $00A00000, $180F0150, $00A80000
Offset_0x0349E6:
                dc.w    $0002
                dc.l    $FC000000, $0000FFF8, $FC000000, $00000000     
;-------------------------------------------------------------------------------
VBlank_Sonic_SEGA_Logo:                                        ; Offset_0x0349F8
                move.w  ($FFFFF662).w, D0                                       
                beq     Return_to_sub_routine                  ; Offset_0x031E96                                         
                clr.w   ($FFFFF662).w                                           
                move.w  (Offset_0x034A0C-$02)(PC, D0), D0                             
                jmp     Offset_0x034A0C(PC, D0)          
Offset_0x034A0C:
                dc.w    Offset_0x034A10-Offset_0x034A0C
                dc.w    Offset_0x034A42-Offset_0x034A0C               
;-------------------------------------------------------------------------------
Offset_0x034A10:
                lea     (VDP_Control_Port), A5                       ; $00C00004
                move.l  #$94169300, (A5)                                        
                move.l  #$96859580, (A5)                                        
                move.w  #$977F, (A5)                                            
                move.w  #$5100, (A5)                                            
                move.w  #$0080, ($FFFFF640).w                                   
                move.w  ($FFFFF640).w, (A5)                                     
                lea     Offset_0x034ABA(PC), A1                                 
                move.l  #$49500003, D0                                          
                bra     Offset_0x034A7E  
;-------------------------------------------------------------------------------                                                       
Offset_0x034A42:
                lea     (VDP_Control_Port), A5                       ; $00C00004
                move.w  #$8F01, (A5)                                            
                move.l  #$941F93FF, (A5)                                        
                move.w  #$9780, (A5)                                            
                move.l  #$40000083, (A5)                                        
                move.w  #$0000, (VDP_Data_Port)                      ; $00C00000
Offset_0x034A64:
                move.w  (A5), D1                                                
                btst    #$01, D1                                                
                bne.s   Offset_0x034A64                                         
                move.w  #$8F02, (A5)                                            
                lea     Offset_0x034ACA(PC), A1                                 
                move.l  #$49A00003, D0                                          
                bra     Offset_0x034A7E                                         
Offset_0x034A7E:
                lea     (VDP_Data_Port), A6                          ; $00C00000
                move.l  #$01000000, D6                                          
                moveq   #$07, D1                                                
                moveq   #$09, D2                                                
Offset_0x034A8E:
                move.l  D0, $0004(A6)                                           
                move.w  D1, D3                                                  
                move.l  A1, A2                                                  
Offset_0x034A96:
                move.w  (A2)+, D4                                               
                bclr    #$0A, D4                                                
                beq.s   Offset_0x034AA2                                         
                bsr     Offset_0x034AB0                                         
Offset_0x034AA2:
                move.w  D4, (A6)                                                
                dbra    D3, Offset_0x034A96                                     
                add.l   D6, D0                                                  
                dbra    D2, Offset_0x034A8E                                     
                rts                                                             
Offset_0x034AB0:
                moveq   #$28, D5                                                
Offset_0x034AB2:
                move.w  D4, (A6)                                                
                dbra    D5, Offset_0x034AB2                                     
                rts    
;-------------------------------------------------------------------------------  
Offset_0x034ABA:
                dc.w    $A080, $A081, $A082, $A083, $A084, $A085, $A086, $A487
;-------------------------------------------------------------------------------  
Offset_0x034ACA:
                dc.w    $A487, $A086, $A085, $A084, $A083, $A082, $A081, $A080   
;-------------------------------------------------------------------------------
Offset_0x034ADA:
                dc.b    $12, $04, $04, $02, $02, $02, $02, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $04
                dc.b    $04, $06, $0A, $08, $06, $04, $04, $04
                dc.b    $04, $06, $06, $08, $08, $0A, $0A, $0C
                dc.b    $0E, $10, $16, $00    
;-------------------------------------------------------------------------------
Sub_Sega_Intro:                                                ; Offset_0x034AFE
                move.w  D1, D2
                andi.w  #$0001, D2
                addq.w  #$01, D2
                lsl.w   #$06, D2
                swap.w  D2
                move.w  D1, D3
                lsr.w   #$01, D3
                addq.w  #$01, D3
                lsl.w   #$06, D3
                swap.w  D3
                bsr     Offset_0x034B2A
                btst    #$01, D0
                beq     Return_to_sub_routine                  ; Offset_0x031E96
                btst    #$01, D1
                bne.s   Offset_0x034B28
                move.l  A3, A5
Offset_0x034B28:
                move.l  A5, A2
Offset_0x034B2A:
                move.l  A2, A4
                swap.w  D2
                lea     $00(A2, D2), A3
                swap.w  D2
                move.w  D1, D5
                andi.w  #$0001, D5
                bsr     Offset_0x034BA4
                btst    #$01, D1
                beq.s   Offset_0x034B66
                swap.w  D2
                move.w  D2, D4
                swap.w  D2
                add.w   D4, D4
                move.w  D0, D3
                andi.w  #$0001, D3
                lsl.w   D3, D4
                adda.w  D4, A4
                move.w  D1, D5
                lsr.w   #$01, D5
                swap.w  D3
                lea     $00(A4, D3), A5
                swap.w  D3
                bsr     Offset_0x034BBC
Offset_0x034B66:
                btst    #$00, D0
                bne.s   Offset_0x034B72
                btst    #$01, D0
                beq.s   Offset_0x034BA2
Offset_0x034B72:
                swap.w  D2
                lea     $00(A2, D2), A2
                lea     $00(A2, D2), A3
                swap.w  D2
                move.w  D1, D5
                andi.w  #$0001, D5
                bsr     Offset_0x034BA4
                btst    #$01, D1
                beq.s   Offset_0x034BA2
                move.w  D1, D5
                lsr.w   #$01, D5
                swap.w  D3
                lea     $00(A4, D3), A4
                lea     $00(A4, D3), A5
                swap.w  D3
                bsr     Offset_0x034BBC
Offset_0x034BA2:
                rts
Offset_0x034BA4:
                moveq   #$07, D6
Offset_0x034BA6:
                bsr     Offset_0x034BD4
                addq.w  #$04, A2
                bsr     Offset_0x034BFE
                addq.w  #$04, A3
                dbra    D6, Offset_0x034BA6
                dbra    D5, Offset_0x034BA4
                rts
Offset_0x034BBC:
                moveq   #$07, D6
Offset_0x034BBE:
                bsr     Offset_0x034C28
                addq.w  #$04, A4
                bsr     Offset_0x034C52
                addq.w  #$04, A5
                dbra    D6, Offset_0x034BBE
                dbra    D5, Offset_0x034BBC
                rts
Offset_0x034BD4:
                bsr     Offset_0x034BD8
Offset_0x034BD8:
                move.b  (A1)+, D2
                move.b  D2, D3
                andi.b  #$F0, D2
                move.b  D2, D4
                lsr.b   #$04, D4
                or.b    D2, D4
                move.b  D4, (A2)+
                move.b  D4, $0003(A2)
                andi.b  #$0F, D3
                move.b  D3, D4
                lsl.b   #$04, D4
                or.b    D3, D4
                move.b  D4, (A2)+
                move.b  D4, $0003(A2)
                rts
Offset_0x034BFE:
                bsr     Offset_0x034C02
Offset_0x034C02:
                move.b  (A1)+, D2
                move.b  D2, D3
                andi.b  #$F0, D2
                move.b  D2, D4
                lsr.b   #$04, D4
                or.b    D2, D4
                move.b  D4, (A3)+
                move.b  D4, $0003(A3)
                andi.b  #$0F, D3
                move.b  D3, D4
                lsl.b   #$04, D4
                or.b    D3, D4
                move.b  D4, (A3)+
                move.b  D4, $0003(A3)
                rts
Offset_0x034C28:
                bsr     Offset_0x034C2C
Offset_0x034C2C:
                move.b  (A1)+, D2
                move.b  D2, D3
                andi.b  #$F0, D2
                move.b  D2, D4
                lsr.b   #$04, D4
                or.b    D2, D4
                move.b  D4, (A4)+
                move.b  D4, $0003(A4)
                andi.b  #$0F, D3
                move.b  D3, D4
                lsl.b   #$04, D4
                or.b    D3, D4
                move.b  D4, (A4)+
                move.b  D4, $0003(A4)
                rts
Offset_0x034C52:
                bsr     Offset_0x034C56
Offset_0x034C56:
                move.b  (A1)+, D2
                move.b  D2, D3
                andi.b  #$F0, D2
                move.b  D2, D4
                lsr.b   #$04, D4
                or.b    D2, D4
                move.b  D4, (A5)+
                move.b  D4, $0003(A5)
                andi.b  #$0F, D3
                move.b  D3, D4
                lsl.b   #$04, D4
                or.b    D3, D4
                move.b  D4, (A5)+
                move.b  D4, $0003(A5)
                rts 
;-------------------------------------------------------------------------------
; Offset_0x034C7C:  ; Dados não usados
                dc.l    $12345678, $12345678
                dc.l    $12345678, $12345678
                dc.l    $12345678, $12345678
                dc.l    $12345678, $12345678                                                                                                                 
;===============================================================================
; Objeto 0xB1 - Sonic correndo na tela SEGA
; <<<- 
;===============================================================================