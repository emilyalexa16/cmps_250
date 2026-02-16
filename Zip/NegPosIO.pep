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
IN:     .BLOCK  2
IP:     .BLOCK  2
msg:    .ASCII  " found at \x00"
nl:     .ASCII  "\n\x00"
comma:  .ASCII  ",\x00"
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
        LDWA    0,i
        STWA    IN,d            ;  IN = 0;
        STWA    IP,d            ;  IP = 0;
ploop:  LDWA    IN,d            ;+ while((IN<NN) || (IP<NP)) {
        CPWA    NN,d            ;|
        BRLT    pneg            ;|
        LDWA    IP,d            ;|
        CPWA    NP,d            ;|
        BRGE    pdone           ;|
        BR      ppos            ;|
pneg:   LDWX    IN,d            ;| + NN = NN - 1;
        ASLX                    ;|   X = NN * 2;
        DECO    AN,x            ;|   Output AN[NN];
        ASRX
        ADDX    1,i
        STWX    IN,d
ppos:   LDBA    "\t",i          ;| + Output "tab" 
        STBA    charOut,d       ;| +
        LDWX    IP,d
        CPWX    NP,d
        BRGE    pnext
        ASLX                    ;| |   X = NP * 2;
        DECO    AP,x            ;| |   Output AP[NP];
        ASRX
        ADDX    1,i
        STWX    IP,d
                                ;| + }
pnext:  LDBA    "\n",i          ;| + Output "new line"
        STBA    charOut,d       ;| +
        BR      ploop           ;| }
pdone:  NOP0                    ;
        ;-----------------------------------------------------------
        DECO    NN,d
        STRO    comma,d
        DECO    NP,d
        STRO    nl,d
        ;-----------------------------------------------------------
loop:   DECI    value,d
        LDWA    value,d
        CPWA    ZERO,d
        BREQ    done
        DECO    value,d
        STRO    msg,d
        LDWA    value,d
        STWA    -2,s
        LDWA    NN,d
        STWA    -4,s
        LDWA    AN,i
        STWA    -6,s
        SUBSP   6,i
        CALL    indexOf
        ADDSP   6,i
        STWA    value,d
        DECO    value,d
        STRO    nl,d
        BR      loop
done:   NOP0
        ;-----------------------------------------------------------
        STOP
        ;-----------------------------------------------------------
        ; int indexOf(int[] A, int AN, int key);
        ;-----------------------------------------------------------
A:      .EQUATE  2
N:      .EQUATE  4 
key:    .EQUATE  6
        ;-----------------------------------------------------------
indexOf:LDWX   0,i
        DECO   A,s
        STRO   comma,d
        DECO   N,s
        STRO   comma,d
        DECO   key,s
        STRO   nl,d
sloop:  CPWX   N,s
        BRGE   sdone
        STRO   comma,d
        ASLX
        LDWA   A,sfx
        CPWA   key,s
        BREQ   sfound
        ASRX
        ADDX   1,i
        BR     sloop
sdone:  LDWX   -1,i
        BR     sreturn
sfound: ASRX
sreturn:STWX   -2,s
        LDWA   -2,s
        RET
        ;-----------------------------------------------------------
        .END