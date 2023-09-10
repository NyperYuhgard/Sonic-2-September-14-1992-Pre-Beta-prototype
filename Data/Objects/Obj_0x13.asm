;===============================================================================
; Objeto 0x13 - Cachoeiras na Hidden Palace
; ->>>        
;===============================================================================     
; Offset_0x01AE38:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01AE46(PC, D0), D1
                jmp     Offset_0x01AE46(PC, D1)
;-------------------------------------------------------------------------------      
Offset_0x01AE46:
                dc.w    Offset_0x01AE4C-Offset_0x01AE46
                dc.w    Offset_0x01AF12-Offset_0x01AE46
                dc.w    Offset_0x01AF9C-Offset_0x01AE46              
;------------------------------------------------------------------------------- 
Offset_0x01AE4C:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #HPz_Waterfalls_Mappings, Obj_Map(A0) ; Offset_0x01AFB4, $0004
                move.w  #$E315, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_03_To_ModifySpriteAttr_2P          ; Offset_0x01B362
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$12, Obj_Map_Id(A0)                             ; $001A
                bsr.s   Offset_0x01AEB4
                move.b  #$A0, Obj_Height_2(A1)                           ; $0016
                bset    #$04, Obj_Flags(A1)                              ; $0001
                move.l  A1, Obj_Control_Var_0C(A0)                       ; $0038
                move.w  Obj_Y(A0), Obj_Control_Var_08(A0)         ; $000C, $0034
                move.w  Obj_Y(A0), Obj_Control_Var_0A(A0)         ; $000C, $0036
                cmpi.b  #$10, Obj_Subtype(A0)                            ; $0028
                bcs.s   Offset_0x01AEF8
                bsr.s   Offset_0x01AEB4
                move.l  A1, Obj_Control_Var_10(A0)                       ; $003C
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$0098, Obj_Y(A1)                                ; $000C
                bra.s   Offset_0x01AEF8
Offset_0x01AEB4:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x01AEF6
                move.b  #$13, Obj_Id(A1)                                 ; $0000
                addq.b  #$04, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.l  #HPz_Waterfalls_Mappings, Obj_Map(A1) ; Offset_0x01AFB4, $0004
                move.w  #$E315, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_00_To_ModifySpriteAttr_2P_A1       ; Offset_0x01B35C
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  #$01, Obj_Priority(A1)                           ; $0018
Offset_0x01AEF6:
                rts
Offset_0x01AEF8:
                moveq   #$00, D1
                move.b  Obj_Subtype(A0), D1                              ; $0028
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                subi.w  #$0078, D0
                lsl.w   #$04, D1
                add.w   D1, D0
                move.w  D0, Obj_Y(A0)                                    ; $000C
                move.w  D0, Obj_Control_Var_08(A0)                       ; $0034
;-------------------------------------------------------------------------------                 
Offset_0x01AF12:
                move.l  Obj_Control_Var_0C(A0), A1                       ; $0038
                move.b  #$12, Obj_Map_Id(A0)                             ; $001A
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                move.w  (Water_Level).w, D1                          ; $FFFFF646
                cmp.w   D0, D1
                bcc.s   Offset_0x01AF2A
                move.w  D1, D0
Offset_0x01AF2A:
                move.w  D0, Obj_Y(A0)                                    ; $000C
                sub.w   Obj_Control_Var_0A(A0), D0                       ; $0036
                addi.w  #$0080, D0
                bmi.s   Offset_0x01AF7C
                lsr.w   #$04, D0
                move.w  D0, D1
                cmpi.w  #$000F, D0
                bcs.s   Offset_0x01AF44
                moveq   #$0F, D0
Offset_0x01AF44:
                move.b  D0, Obj_Map_Id(A1)                               ; $001A
                cmpi.b  #$10, Obj_Subtype(A0)                            ; $0028
                bcs.s   Offset_0x01AF64
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                subi.w  #$000F, D1
                bcc.s   Offset_0x01AF5C
                moveq   #$00, D1
Offset_0x01AF5C:
                addi.w  #$0013, D1
                move.b  D1, Obj_Map_Id(A1)                               ; $001A
Offset_0x01AF64:
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Jmp_03_To_DeleteObject                 ; Offset_0x01B356
                bra     Jmp_03_To_DisplaySprite                ; Offset_0x01B350
Offset_0x01AF7C:
                moveq   #$13, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                move.b  D0, Obj_Map_Id(A1)                               ; $001A
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Jmp_03_To_DeleteObject                 ; Offset_0x01B356
                rts
;-------------------------------------------------------------------------------                 
Offset_0x01AF9C:
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Jmp_03_To_DeleteObject                 ; Offset_0x01B356
                bra     Jmp_03_To_DisplaySprite                ; Offset_0x01B350 
;-------------------------------------------------------------------------------
HPz_Waterfalls_Mappings:                                       ; Offset_0x01AFB4
                dc.w    Offset_0x01AFEE-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01AFF8-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B00A-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B01C-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B036-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B050-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B072-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B094-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B0BE-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B0E8-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B11A-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B14C-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B186-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B1C0-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B202-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B244-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B28E-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B28E-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B28E-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01AFEC-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B2A0-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B2AA-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B2B4-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B2C6-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B2D8-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B2F2-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B30C-HPz_Waterfalls_Mappings
                dc.w    Offset_0x01B32E-HPz_Waterfalls_Mappings
Offset_0x01AFEC:
                dc.w    $0000
Offset_0x01AFEE:
                dc.w    $0001
                dc.l    $800C0010, $0008FFF0
Offset_0x01AFF8:
                dc.w    $0002
                dc.l    $800C0010, $0008FFF0
                dc.l    $880D002D, $0016FFF0
Offset_0x01B00A:
                dc.w    $0002
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
Offset_0x01B01C:
                dc.w    $0003
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80D002D, $0016FFF0
Offset_0x01B036:
                dc.w    $0003
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
Offset_0x01B050:
                dc.w    $0004
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
                dc.l    $C80D002D, $0016FFF0
Offset_0x01B072:
                dc.w    $0004
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
                dc.l    $C80F0000, $0000FFF0
Offset_0x01B094:
                dc.w    $0005
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
                dc.l    $C80F0000, $0000FFF0
                dc.l    $E80D002D, $0016FFF0
Offset_0x01B0BE:
                dc.w    $0005
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
                dc.l    $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0
Offset_0x01B0E8:
                dc.w    $0006
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
                dc.l    $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0
                dc.l    $080D002D, $0016FFF0
Offset_0x01B11A:
                dc.w    $0006
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
                dc.l    $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0
                dc.l    $080F0000, $0000FFF0
Offset_0x01B14C:
                dc.w    $0007
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
                dc.l    $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0
                dc.l    $080F0000, $0000FFF0
                dc.l    $280D002D, $0016FFF0
Offset_0x01B186:
                dc.w    $0007
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
                dc.l    $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0
                dc.l    $080F0000, $0000FFF0
                dc.l    $280F0000, $0000FFF0
Offset_0x01B1C0:
                dc.w    $0008
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
                dc.l    $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0
                dc.l    $080F0000, $0000FFF0
                dc.l    $280F0000, $0000FFF0
                dc.l    $480D002D, $0016FFF0
Offset_0x01B202:
                dc.w    $0008
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
                dc.l    $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0
                dc.l    $080F0000, $0000FFF0
                dc.l    $280F0000, $0000FFF0
                dc.l    $480F0000, $0000FFF0
Offset_0x01B244:
                dc.w    $0009
                dc.l    $800C0010, $0008FFF0
                dc.l    $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
                dc.l    $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0
                dc.l    $080F0000, $0000FFF0
                dc.l    $280F0000, $0000FFF0
                dc.l    $480F0000, $0000FFF0
                dc.l    $680D002D, $0016FFF0
Offset_0x01B28E:
                dc.w    $0002
                dc.l    $F00A0018, $000CFFE8
                dc.l    $F00A0818, $080C0000
Offset_0x01B2A0:
                dc.w    $0001
                dc.l    $E00D002D, $0016FFF0
Offset_0x01B2AA:
                dc.w    $0001
                dc.l    $E00F0000, $0000FFF0
Offset_0x01B2B4:
                dc.w    $0002
                dc.l    $E00F0000, $0000FFF0
                dc.l    $000D002D, $0016FFF0
Offset_0x01B2C6:
                dc.w    $0002
                dc.l    $E00F0000, $0000FFF0
                dc.l    $000F0000, $0000FFF0
Offset_0x01B2D8:
                dc.w    $0003
                dc.l    $E00F0000, $0000FFF0
                dc.l    $000F0000, $0000FFF0
                dc.l    $200D002D, $0016FFF0
Offset_0x01B2F2:
                dc.w    $0003
                dc.l    $E00F0000, $0000FFF0
                dc.l    $000F0000, $0000FFF0
                dc.l    $200F0000, $0000FFF0
Offset_0x01B30C:
                dc.w    $0004
                dc.l    $E00F0000, $0000FFF0
                dc.l    $000F0000, $0000FFF0
                dc.l    $200F0000, $0000FFF0
                dc.l    $400D002D, $0016FFF0
Offset_0x01B32E:
                dc.w    $0004
                dc.l    $E00F0000, $0000FFF0
                dc.l    $000F0000, $0000FFF0
                dc.l    $200F0000, $0000FFF0
                dc.l    $400F0000, $0000FFF0
;===============================================================================   
; Objeto 0x13 - Cachoeiras na Hidden Palace
; <<<-        
;===============================================================================