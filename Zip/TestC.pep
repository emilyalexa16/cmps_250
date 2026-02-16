; Test Program to investigate the setting of the C bit in the
; condition codes as a result of shifting
        BR      main
mess:   .ASCII  "For \x00"
messaka:.ASCII  " aka \x00"
mess0:  .ASCII  " C is 0\n\x00"
mess1:  .ASCII  " C is 1\n\x00"
messand:.ASCII  "Now \x00"
value:  .BLOCK  2
;------------------------------------------------------------------------------
main:   NOP0
        STRO    mess,d
;        LDWA    0x0000,i    ; also try 0001, FFFF, FFFE, 8000, 7000, 7FFF, 7FFE
        LDWA    0x0001,i    ; also try 0001, FFFF, FFFE, 8000, 7000, 7FFF, 7FFE
;        LDWA    0xFFFF,i    ; also try 0001, FFFF, FFFE, 8000, 7000, 7FFF, 7FFE
;        LDWA    0xFFFe,i    ; also try 0001, FFFF, FFFE, 8000, 7000, 7FFF, 7FFE
;        LDWA    0x8000,i    ; also try 0001, FFFF, FFFE, 8000, 7000, 7FFF, 7FFE
;        LDWA    0x7000,i    ; also try 0001, FFFF, FFFE, 8000, 7000, 7FFF, 7FFE
;        LDWA    0x7FFF,i    ; also try 0001, FFFF, FFFE, 8000, 7000, 7FFF, 7FFE
;        LDWA    0x7FFE,i    ; also try 0001, FFFF, FFFE, 8000, 7000, 7FFF, 7FFE
;------------------------------------------------------------------------------
        STWA    value,d
        HEXO    value,d
        STRO    messaka,d
        DECO    value,d
;------------------------------------------------------------------------------
        ASRA                ; the idea is that the "lost bit" goes into the "carry"
        BRC     Do1         ; branch if the carry is set
;------------------------------------------------------------------------------
Do0:    STRO    mess0,d
        BR      Done
Do1:    STRO    mess1,d
        BR      Done
Done:   STRO    messand,d
        STWA    value,d
        HEXO    value,d 
        STOP
        .END