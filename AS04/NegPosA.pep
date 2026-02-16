;NegPosA - Print Negatives and Positives in two columns
;
; P.M.J., April 2018
;---------------------------------------------------------------
        BR      main
ZERO:   .WORD   0               ;the input sentinel value
NL:     .BYTE   '\n'            ;the "new line" character
NN:     .WORD   0               ;count of the number of negatives
NP:     .WORD   0               ;count of the number of positives
value:  .BLOCK  2               ;the value read
AN:     .BLOCK  32              ;the array of negatives 
AP:     .BLOCK  32              ;the array of positives
;---------------------------------------------------------------
main:   NOP0
        ;-------------------------------------------------------
        ; Input loop to populate the arrays AN and AP,
        ; using NN and NP respectively
        ;-------------------------------------------------------
iloop:  DECI    value,d         ;+ while(value != ZERO) { 
        LDWA    value,d         ;| A = value;
        CPWA    ZERO,d          ;| check for sentinel value
        BREQ    idone           ;| branch to exit loop
        BRGT    ipos            ;| + if(value < 0) {
ineg:   NOP0                    ;| |
        LDWX    NN,d            ;| | + X = NN * 2;
        ASLX                    ;| | +
        STWA    AN,x            ;| |   AN[NN] = value;
        LDWX    NN,d            ;| | + NN = NN + 1;  
        ADDX    1,i             ;| | |
        STWX    NN,d            ;| | +
        BR      inext           ;| | } else {
ipos:   NOP0                    ;| | // (value > 0) 
        LDWX    NP,d            ;| | + X = NP * 2;
        ASLX                    ;| | +
        STWA    AP,x            ;| |   AP[NP] = value;
        LDWX    NP,d            ;| | + NP = NP + 1; 
        ADDX    1,i             ;| | |
        STWX    NP,d            ;| | +
;                               ;| + }
inext:  BR      iloop           ;+ }
        ;--------------------------------------------------------
idone:  NOP0                    ;+ Output message
        DECO    NN,d            ;| Output number of negatives
        LDBA    ",",i           ;|
        STBA    charOut,d       ;|
        DECO    NP,d            ;| Output number of positives
        LDBA    "\n",i          ;| + Output "new line"
        STBA    charOut,d       ;| +
        ;--------------------------------------------------------
        ; Output loop to produce a "two column" print of the values
        ; in the arrays AN and AP using NN and NP respectively
        ;-------------------------------------------------------
ploop:  LDWA    NN,d            ;+ while((NN>0) || (NP>0)) {
        CPWA    0,i             ;|
        BRGT    pneg            ;|
        LDWA    NP,d            ;|
        CPWA    0,i             ;|
        BREQ    pdone           ;|
        BR      ppos            ;|
pneg:   LDWX    NN,d            ;| + NN = NN - 1;
        SUBX    1,i             ;| |
        STWX    NN,d            ;| +
        ASLX                    ;|   X = NN * 2;
        DECO    AN,x            ;|   Output AN[NN];
ppos:   LDBA    "\t",i          ;| + Output "tab" 
        STBA    charOut,d       ;| +
        LDWA    NP,d            ;| + if(NP > 0) {
        CPWA    0,i             ;| |
        BREQ    pnext           ;| |
        LDWX    NP,d            ;| | + NP = NP - 1;
        SUBX    1,i             ;| | |
        STWX    NP,d            ;| | +
        ASLX                    ;| |   X = NP * 2;
        DECO    AP,x            ;| |   Output AP[NP];
                                ;| + }
pnext:  LDBA    "\n",i          ;| + Output "new line"
        STBA    charOut,d       ;| +
        BR      ploop           ;| }
pdone:  NOP0                    ;
        ;-----------------------------------------------------------
        STOP
        .END