;===============================================================================
; Objeto 0x98 - Armas usadas pelos inimigos. Ex: Coco atirado pelo Coconuts
; ->>> 
;===============================================================================
; Offset_0x031B36:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x031B44(PC, D0), D1
                jmp     Offset_0x031B44(PC, D1)
;-------------------------------------------------------------------------------    
Offset_0x031B44:
                dc.w    Offset_0x031B48-Offset_0x031B44
                dc.w    Offset_0x031B4C-Offset_0x031B44       
;-------------------------------------------------------------------------------
Offset_0x031B48:
                bra     Object_Settings                        ; Offset_0x030A30
Offset_0x031B4C:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                move.l  Obj_Timer(A0), A1                                ; $002A
                jsr     (A1)
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608  
;-------------------------------------------------------------------------------   
Nebula_Weapon:                                                 ; Offset_0x031B5E
                bchg    #06, Obj_Art_VRAM(A0)                            ; $0002
                bra     Jmp_0B_To_ObjectFall                   ; Offset_0x037650   
;-------------------------------------------------------------------------------
Turtloid_Weapon:                                               ; Offset_0x031B68
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Turtloid_Weapon_Animate_Data), A1     ; Offset_0x031F9E                             
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
;-------------------------------------------------------------------------------   
Coconuts_Weapon:                                               ; Offset_0x031B76
                addi.w  #$0020, Obj_Speed_Y(A0)                          ; $0012
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                rts   
;-------------------------------------------------------------------------------
Clucker_Weapon:                                                ; Offset_0x031B82
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Clucker_Weapon_Animate_Data), A1      ; Offset_0x033986                                
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620    
;-------------------------------------------------------------------------------                
Spiny_Weapon:                                                  ; Offset_0x031B90
                addi.w  #$0020, Obj_Speed_Y(A0)                          ; $0012
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Spiny_Weapon_Animate_Data), A1        ; Offset_0x0330AC
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
;-------------------------------------------------------------------------------                
Cannon_Weapon:                                                 ; Offset_0x031BA4
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Cannon_Weapon_Animate_Data), A1       ; Offset_0x035988                           
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620  
;-------------------------------------------------------------------------------  
Rexon_Fireball_Map_Ptr:                                        ; Offset_0x031BB2
                dc.l    Rexon_Mappings                         ; Offset_0x031AC6
                dc.w    $237E
                dc.b    $84, $04, $04, $98     
;-------------------------------------------------------------------------------  
Nebula_Bomb_Map_Ptr:                                           ; Offset_0x031BBC
                dc.l    Nebula_Mappings                        ; Offset_0x031CE8
                dc.w    $A36E
                dc.b    $84, $04, $08, $8B     
;-------------------------------------------------------------------------------      
Turtloid_Bullet_Map_Ptr:                                       ; Offset_0x031BC6
                dc.l    Turtloid_Mappings                      ; Offset_0x031FB0
                dc.w    $038A
                dc.b    $84, $04, $04, $98    
;-------------------------------------------------------------------------------
Coconuts_Coconut_Map_Ptr:                                      ; Offset_0x031BD0
                dc.l    Coconuts_Mappings                      ; Offset_0x0321E4
                dc.w    $03EE
                dc.b    $84, $04, $08, $8B   
;-------------------------------------------------------------------------------
Asteron_Spikes_Map_Ptr:                                        ; Offset_0x031BDA
                dc.l    Asteron_Mappings                       ; Offset_0x032E7E
                dc.w    $8368
                dc.b    $84, $05, $04, $98    
;-------------------------------------------------------------------------------
Spiny_Shot_Map_Ptr:                                            ; Offset_0x031BE4
                dc.l    Spiny_Mappings                         ; Offset_0x0330B2
                dc.w    $252D
                dc.b    $84, $05, $04, $98      
;-------------------------------------------------------------------------------  
Grabber_Unk_Map_Ptr:                                           ; Offset_0x031BEE
                dc.l    Grabber_Mappings                       ; Offset_0x0335F8
                dc.w    $A500
                dc.b    $84, $04, $04, $98
;-------------------------------------------------------------------------------
Clucker_Bullet_Map_Ptr:                                        ; Offset_0x031BF8
                dc.l    Clucker_Mappings                       ; Offset_0x033992
                dc.w    $0379
                dc.b    $84, $05, $04, $98    
;-------------------------------------------------------------------------------
Metal_Sonic_Spikes_Map_Ptr:                                    ; Offset_0x031C02
                dc.l    Metal_Sonic_Mappings                   ; Offset_0x0341D6
                dc.w    $2380
                dc.b    $84, $05, $04, $98    
;-------------------------------------------------------------------------------
Cannon_Bullet_Map_Ptr:                                         ; Offset_0x031C0C
                dc.l    SFz_Cannon_Mappings                    ; Offset_0x03598E
                dc.w    $03AB
                dc.b    $84, $03, $04, $98                                                                                                                                                                                  
;===============================================================================
; Objeto 0x98 - Armas usadas pelos inimigos. Ex: Coco atirado pelo Coconuts
; <<<- 
;===============================================================================