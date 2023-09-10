;===============================================================================
; Objeto 0x2E - Conteúdo dos monitores
; ->>>        
;===============================================================================  
; Offset_0x00F87E:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00F88C(PC, D0), D1
                jmp     Offset_0x00F88C(PC, D1)
Offset_0x00F88C:                                                   
                dc.w    Offset_0x00F892-Offset_0x00F88C
                dc.w    Offset_0x00F8D6-Offset_0x00F88C
                dc.w    Offset_0x00FA42-Offset_0x00F88C     
Offset_0x00F892:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$8680, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$24, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.w  #$FD00, Obj_Speed_Y(A0)                          ; $0012
                moveq   #$00, D0
                move.b  Obj_Ani_Number(A0), D0                           ; $001C
                addq.b  #$01, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                move.l  #Monitors_Mappings, A1                 ; Offset_0x00FB30
                add.b   D0, D0
                adda.w  $00(A1, D0), A1
                addq.w  #$02, A1
                move.l  A1, Obj_Map(A0)                                  ; $0004
Offset_0x00F8D6:
                bsr.s   Offset_0x00F8DC
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00F8DC:
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bpl     Offset_0x00F8F0
                bsr     SpeedToPos                             ; Offset_0x011F96
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                rts
Offset_0x00F8F0:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$001D, Obj_Ani_Time(A0)                         ; $001E
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$00, D0
                move.b  Obj_Ani_Number(A0), D0                           ; $001C
                add.w   D0, D0
                move.w  Monitor_Subroutines(PC, D0), D0        ; Offset_0x00F90E
                jmp     Monitor_Subroutines(PC, D0)            ; Offset_0x00F90E
;-------------------------------------------------------------------------------                   
Monitor_Subroutines:                                           ; Offset_0x00F90E                       
                dc.w    Monitor_Empty-Monitor_Subroutines      ; Offset_0x00F922
                dc.w    Monitor_SonicLife-Monitor_Subroutines  ; Offset_0x00F924
                dc.w    Monitor_MilesLife-Monitor_Subroutines  ; Offset_0x00F936
                dc.w    Monitor_Robotnik-Monitor_Subroutines   ; Offset_0x00F922
                dc.w    Monitor_Rings-Monitor_Subroutines      ; Offset_0x00F948
                dc.w    Monitor_Shoes-Monitor_Subroutines      ; Offset_0x00F982
                dc.w    Monitor_Shield-Monitor_Subroutines     ; Offset_0x00F9AA
                dc.w    Monitor_Invincibility-Monitor_Subroutines ; Offset_0x00F9C0
                dc.w    Monitor_Question_Mark-Monitor_Subroutines ; Offset_0x00F9EC
                dc.w    Monitor_Spring-Monitor_Subroutines     ; Offset_0x00F922   
;-------------------------------------------------------------------------------                
Monitor_Empty:                                                 ; Offset_0x00F922
Monitor_Robotnik:
Monitor_Spring:
                rts     
;-------------------------------------------------------------------------------                    
Monitor_SonicLife:                                             ; Offset_0x00F924
                addq.b  #$01, (Life_Count).w                         ; $FFFFFE12
                addq.b  #$01, (HUD_Life_Refresh_Flag).w              ; $FFFFFE1C                           
                move.w  #$0098, D0                                              
                jmp     (Play_Music)                           ; Offset_0x00190C    
;-------------------------------------------------------------------------------
Monitor_MilesLife:                                             ; Offset_0x00F936
                addq.b  #$01, (Life_Count).w                         ; $FFFFFE12
                addq.b  #$01, (HUD_Life_Refresh_Flag).w              ; $FFFFFE1C                              
                move.w  #$0098, D0                                              
                jmp     (Play_Music)                           ; Offset_0x00190C   
;-------------------------------------------------------------------------------
Monitor_Rings:                                                 ; Offset_0x00F948
                addi.w  #$000A, (Ring_Count).w                       ; $FFFFFE20
                ori.b   #$01, (HUD_Rings_Refresh_Flag).w             ; $FFFFFE1D
                cmpi.w  #$0064, (Ring_Count).w                       ; $FFFFFE20
                bcs.s   Offset_0x00F978
                bset    #$01, (Ring_Life_Flag).w                     ; $FFFFFE1B
                beq     Monitor_SonicLife                      ; Offset_0x00F924
                cmpi.w  #$00C8, (Ring_Count).w                       ; $FFFFFE20
                bcs.s   Offset_0x00F978
                bset    #$02, (Ring_Life_Flag).w                     ; $FFFFFE1B
                beq     Monitor_SonicLife                      ; Offset_0x00F924
Offset_0x00F978:
                move.w  #$00B5, D0
                jmp     (Play_Music)                           ; Offset_0x00190C  
;-------------------------------------------------------------------------------    
Monitor_Shoes:                                                 ; Offset_0x00F982
                bset    #$02, Obj_Player_Status(A1)                      ; $002B
                move.w  #$04B0, ($FFFFB034).w
                move.w  #$0C00, (Sonic_Max_Speed).w                  ; $FFFFF760
                move.w  #$0018, (Sonic_Acceleration).w               ; $FFFFF762
                move.w  #$0080, (Sonic_Deceleration).w               ; $FFFFF764
                move.w  #$00FB, D0
                jmp     (Play_Music)                           ; Offset_0x00190C   
;-------------------------------------------------------------------------------
Monitor_Shield:                                                ; Offset_0x00F9AA
                bset    #$00, Obj_Player_Status(A1)                      ; $002B
                move.b  #$38, ($FFFFB180).w
                move.w  #$00AF, D0
                jmp     (Play_Music)                           ; Offset_0x00190C    
;-------------------------------------------------------------------------------
Monitor_Invincibility:                                         ; Offset_0x00F9C0
                bset    #$01, Obj_Player_Status(A1)                      ; $002B
                move.w  #$04B0, ($FFFFB032).w
                move.b  #$35, ($FFFFB200).w
                tst.b   (Boss_Flag).w                                ; $FFFFF7AA
                bne.s   Offset_0x00F9EA
                cmpi.b  #$0C, ($FFFFB028).w
                bls.s   Offset_0x00F9EA
                move.w  #$0097, D0
                jmp     (Play_Music)                           ; Offset_0x00190C
Offset_0x00F9EA:
                rts        
;-------------------------------------------------------------------------------
Monitor_Question_Mark:                                         ; Offset_0x00F9EC
                move.b  #$01, ($FFFFF65F).w
                move.b  #$0F, ($FFFFF65E).w
                move.b  #$01, ($FFFFFE19).w
                move.b  #$81, ($FFFFB02A).w
                move.b  #$1F, ($FFFFB01C).w
                move.b  #$7E, ($FFFFB540).w
                move.w  #$0A00, (Sonic_Max_Speed).w                  ; $FFFFF760
                move.w  #$0030, (Sonic_Acceleration).w               ; $FFFFF762
                move.w  #$0100, (Sonic_Deceleration).w               ; $FFFFF764
                move.w  #$0000, ($FFFFB032).w
                bset    #$01, Obj_Player_Status(A1)                      ; $002B
                move.w  #$00DF, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                move.w  #$0096, D0
                jmp     (Play_Music)                           ; Offset_0x00190C                                                                                                                    
;===============================================================================   
; Objeto 0x2E - Conteúdo dos monitores
; <<<-        
;===============================================================================