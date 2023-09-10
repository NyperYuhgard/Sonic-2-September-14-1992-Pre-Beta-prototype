;===============================================================================
; Objeto 0x6F - Elevadores em forma de paralelogramos na Metropolis #3
; ->>>
;===============================================================================
; Offset_0x022FB4:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x022FC2(PC, D0), D1
                jmp     Offset_0x022FC2(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x022FC2:
                dc.w    Offset_0x022FC6-Offset_0x022FC2
                dc.w    Offset_0x02302C-Offset_0x022FC2   
;-------------------------------------------------------------------------------    
Offset_0x022FC6:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Parallelogram_Elevator_Mappings, Obj_Map(A0) ; Offset_0x02327A, $0004
                move.w  #$653F, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_1D_To_ModifySpriteAttr_2P          ; Offset_0x023300
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$80, Obj_Width(A0)                              ; $0019
                move.b  #$20, Obj_Height_2(A0)                           ; $0016
                move.w  Obj_X(A0), Obj_Control_Var_06(A0)         ; $0008, $0032
                move.w  Obj_Y(A0), Obj_Control_Var_04(A0)         ; $000C, $0030
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsr.w   #$03, D0
                andi.w  #$000E, D0
                lea     (Parallelogram_Elevator_Data), A1      ; Offset_0x0230EE
                move.w  $00(A1, D0), D0
                lea     $00(A1, D0), A1
                move.l  A1, Obj_Control_Var_10(A0)                       ; $003C
                bsr     Offset_0x0230C0
                bset    #$07, Obj_Status(A0)                             ; $0022
                andi.b  #$0F, Obj_Subtype(A0)                            ; $0028
Offset_0x02302C:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                add.w   D0, D0
                move.w  Offset_0x023096(PC, D0), D1
                jsr     Offset_0x023096(PC, D1)
                move.w  (A7)+, D4
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                lea     (Parallelogram_Elevator_Solid_Data), A2 ; Offset_0x02317A
                bsr     Offset_0x023306
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x02306A
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x02306A:
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x02307E
                rts
Offset_0x02307E:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x023090
                bclr    #$07, $02(A2, D0)
Offset_0x023090:
                jmp     (DeleteObject)                         ; Offset_0x0120D0
;-------------------------------------------------------------------------------
Offset_0x023096:
                dc.w    Offset_0x02309C-Offset_0x023096
                dc.w    Offset_0x02309E-Offset_0x023096
                dc.w    Offset_0x0230AE-Offset_0x023096
;-------------------------------------------------------------------------------   
Offset_0x02309C:
                rts
Offset_0x02309E:
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq.s   Offset_0x0230AC
                addq.b  #$01, Obj_Subtype(A0)                            ; $0028
Offset_0x0230AC:
                rts
Offset_0x0230AE:
                jsr     (SpeedToPos)                           ; Offset_0x011F96
                subq.w  #$01, Obj_Control_Var_08(A0)                     ; $0034
                bne.s   Offset_0x0230BE
                bsr     Offset_0x0230C0
Offset_0x0230BE:
                rts
Offset_0x0230C0:
                moveq   #$00, D0
                move.b  Obj_Control_Var_0C(A0), D0                       ; $0038
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                move.w  (A1)+, D1
                lea     $00(A1, D0), A1
                move.w  (A1)+, Obj_Speed(A0)                             ; $0010
                move.w  (A1)+, Obj_Speed_Y(A0)                           ; $0012
                move.w  (A1)+, Obj_Control_Var_08(A0)                    ; $0034
                addq.b  #$06, Obj_Control_Var_0C(A0)                     ; $0038
                cmp.b   Obj_Control_Var_0C(A0), D1                       ; $0038
                bhi.s   Offset_0x0230EC
                move.b  #$00, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x0230EC:
                rts    
;-------------------------------------------------------------------------------
Parallelogram_Elevator_Data:                                   ; Offset_0x0230EE
                dc.w    Offset_0x0230F8-Parallelogram_Elevator_Data
                dc.w    Offset_0x023106-Parallelogram_Elevator_Data
                dc.w    Offset_0x023114-Parallelogram_Elevator_Data
                dc.w    Offset_0x02312E-Parallelogram_Elevator_Data
                dc.w    Offset_0x023160-Parallelogram_Elevator_Data
Offset_0x0230F8:
                dc.w    $000C               ; Número de movimentos dividido por 6 ex.: $06 = 1, $0C = 2 ...
                dc.w    $0100, $FF80, $0100 ; Velocidade X / Velocidade Y / Tempo antes do próximo movimento
                dc.w    $FF00, $0080, $0100
Offset_0x023106:
                dc.w    $000C
                dc.w    $0100, $FF80, $0180
                dc.w    $FF00, $0080, $0180
Offset_0x023114:
                dc.w    $0018
                dc.w    $FF00, $0080, $0080
                dc.w    $FF00, $0000, $0180
                dc.w    $0100, $FF80, $0080
                dc.w    $0100, $0000, $0180
Offset_0x02312E:
                dc.w    $0030
                dc.w    $0100, $FF80, $0200
                dc.w    $0100, $0000, $0100
                dc.w    $FF00, $0080, $0100
                dc.w    $0100, $0000, $0180
                dc.w    $FF00, $0000, $0180
                dc.w    $0100, $FF80, $0100
                dc.w    $FF00, $0000, $0100
                dc.w    $FF00, $0080, $0200
Offset_0x023160:
                dc.w    $0018
                dc.w    $FF00, $0080, $0180
                dc.w    $0100, $0000, $0200
                dc.w    $FF00, $0000, $0200
                dc.w    $0100, $FF80, $0180 
;-------------------------------------------------------------------------------
Parallelogram_Elevator_Solid_Data:                             ; Offset_0x02317A
                dc.w    $E101, $E202, $E303, $E404, $E505, $E606, $E707, $E808
                dc.w    $E909, $EA0A, $EB0B, $EC0C, $ED0D, $EE0E, $EF0F, $F010
                dc.w    $F111, $F212, $F313, $F414, $F515, $F616, $F717, $F818
                dc.w    $F919, $FA1A, $FB1B, $FC1C, $FD1D, $FE1E, $FF1F, $0020
                dc.w    $0121, $0222, $0323, $0424, $0525, $0626, $0727, $0828
                dc.w    $0929, $0A2A, $0B2B, $0C2C, $0D2D, $0E2E, $0F2F, $1030
                dc.w    $1131, $1232, $1333, $1434, $1535, $1636, $1737, $1838
                dc.w    $1939, $1A3A, $1B3B, $1C3C, $1D3D, $1E3E, $1F3F, $2040
                dc.w    $2040, $203F, $203E, $203D, $203C, $203B, $203A, $2039
                dc.w    $2038, $2037, $2036, $2035, $2034, $2033, $2032, $2031
                dc.w    $2030, $202F, $202E, $202D, $202C, $202B, $202A, $2029
                dc.w    $2028, $2027, $2026, $2025, $2024, $2023, $2022, $2021
                dc.w    $2020, $201F, $201E, $201D, $201C, $201B, $201A, $2019
                dc.w    $2018, $2017, $2016, $2015, $2014, $2013, $2012, $2011
                dc.w    $2010, $200F, $200E, $200D, $200C, $200B, $200A, $2009
                dc.w    $2008, $2007, $2006, $2005, $2004, $2003, $2002, $2001  
;-------------------------------------------------------------------------------
Parallelogram_Elevator_Mappings:                               ; Offset_0x02327A
                dc.w    Offset_0x02327C-Parallelogram_Elevator_Mappings
Offset_0x02327C:
                dc.w    $0010
                dc.l    $100D0000, $0000FF80
                dc.l    $000D0000, $0000FFA0
                dc.l    $100D0008, $0004FFA0
                dc.l    $F00D0000, $0000FFC0
                dc.l    $000F0010, $0008FFC0
                dc.l    $E00D0000, $0000FFE0
                dc.l    $F00D0008, $0004FFE0
                dc.l    $000F0010, $0008FFE0
                dc.l    $E00F0010, $00080000
                dc.l    $000D0008, $00040000
                dc.l    $100D1800, $18000000
                dc.l    $E00F0010, $00080020
                dc.l    $000D1800, $18000020
                dc.l    $E00D0008, $00040040
                dc.l    $F00D1800, $18000040
                dc.l    $E00D1800, $18000060                       
;===============================================================================
; Objeto 0x6F - Elevadores em forma de paralelogramos na Metropolis #3
; <<<-
;===============================================================================