;NegPosAS - Print Negatives and Positives in two columns, each in ascending order
;
; P.M.J., April 2018
; Emily Alexa Gotiangco, April 2024
; collaborated with Jonathon Purvis
;---------------------------------------------------------------
          BR      main
ZERO:     .WORD   0               ;the input sentinel value
NL:       .BYTE   '\n'            ;the "new line" character
NN:       .WORD   0               ;count of the number of negatives
NP:       .WORD   0               ;count of the number of positives
value:    .BLOCK  2               ;the value read
AN:       .BLOCK  32              ;the array of negatives 
AP:       .BLOCK  32              ;the array of positives
n_out:    .WORD   0               ;the array index we are currently on in the negative number array, in the printing stage
p_out:    .WORD   0               ;the array index we are currently on in the positive number array, in the printing stage
;---------------------------------------------------------------
main:     NOP0
          ;-------------------------------------------------------
          ; Input loop to populate the arrays AN and AP,
          ; using NN and NP respectively
          ;-------------------------------------------------------
inp_loop: DECI    value,d         ;+ while(value != ZERO) { 
          LDWA    value,d         ;| A = value;
          CPWA    ZERO,d          ;| check for sentinel value
          BREQ    idone           ;| branch to exit loop
          BRGT    first_p         ;| + if(value < 0) {
first_n:  NOP0
          LDWX   NN,d
          LDWA   AN,x             
          CPWA   0,i              
          BRNE   n_setup          ; check if the negative number input is first in the array
          LDWA   value,d
          STWA   AN,x
          ADDX   1,i
          STWX   NN,d             ; put the first negative number input as the first value in the array
          BR     inp_loop         ; go back to input loop to check next input
n_setup:  LDWA   value,d          ; change the index to a displacement
          SUBX   1,i
          ASLX 
n_shift:  LDWA   value,d
          CPWA   AN,x
          BRGE   n_insert         ; if the input value is greater than the value in the array, the right spot has been found  
          LDWA   AN,x             ; if not, shift the value in the array to the right
          ADDX   2,i
          STWA   AN,x
          SUBX   4,i
          BR     n_shift          ; keep shifting until the right spot to place the input value has been found
n_insert: ADDX   2,i
          STWA   AN,x             ; put the input value in its right spot
          LDWX   NN,d
          ADDX   1,i              ; increment the negative number count by 1
          STWX   NN,d
          BR     inp_loop         ; look at the next input value         
;-----------------------------------;              
first_p:  NOP0
          LDWX   NP,d
          LDWA   AP,x
          CPWA   0,i
          BRNE   p_setup          ; check if the positive number input is first in the array 
          LDWA   value,d
          STWA   AP,x
          ADDX   1,i
          STWX   NP,d             ; put the first positive number input as the first value in the array
          BR     inp_loop         ; go back to input loop to check next input
p_setup:  LDWA   value,d
          SUBX   1,i
          ASLX 
p_shift:  LDWA   value,d
          CPWA   AP,x
          BRGE   p_insert         ; if the input value is greater than the value in the array, the right spot has been found
          LDWA   AP,x             ; if not, shift the value in the array to the right
          ADDX   2,i
          STWA   AP,x
          SUBX   4,i
          BR     p_shift          ; keep shifting until the right spot to place the input value has been found
p_insert: ADDX   2,i
          STWA   AP,x             ; put the input value in its right spot
          LDWX   NP,d
          ADDX   1,i              ; increment the positive number count by 1
          STWX   NP,d
          BR     inp_loop         ; look at the next input value  
          ;--------------------------------------------------------
idone:    NOP0                    ;+ Output message
          DECO    NN,d            ;| Output number of negatives
          LDBA    ",",i           ;|
          STBA    charOut,d       ;|
          DECO    NP,d            ;| Output number of positives
          LDBA    "\n",i          ;| + Output "new line"
          STBA    charOut,d       ;| +
          ;--------------------------------------------------------
          ; Output loop to produce a "two column" print of the values
          ; in the arrays AN and AP using NN and NP respectively,
          ; each column in ascending order
          ;-------------------------------------------------------
check_n:  LDWX    n_out,d 
          CPWX    NN,d
          BRGE    excess_p        ; branch if there are no more negative numbers to print    
print_n:  ASLX
          DECO    AN,x            ; print the negative number in the array index we are up to
          ASRX
          ADDX    1,i
          STWX    n_out,d         ; increment the array index we are checking by 1 
          LDBA    "\t", i         ; print a tab to separate the negative and positive values 
          STBA    charOut,d
check_p:  LDWX    p_out,d 
          CPWX    NP,d
          BRGE    check_n         ; branch if there are no more positive numbers to print    
print_p:  ASLX
          DECO    AP,x            ; print the positive number in the array index we are up to
          ASRX
          ADDX    1,i
          STWX    p_out,d         ; increment the array index we are checking by 1
          LDBA    NL,d            ; print a new line to create a new row 
          STBA    charOut,d
          BR      check_n         ; check if there are more negative numbers to print
excess_p: LDWX    p_out,d 
          CPWX    NP,d
          BRGE    pdone           ; branch if there are no more positive AND negative numbers to print       
          ASLX
          LDBA    "\t", i         ; print a tab to keep the positive values aligned
          STBA    charOut,d
          DECO    AP,x            ; print the positive number in the array index we are up to
          ASRX
          ADDX    1,i             
          STWX    p_out,d         ; increment the array index we are checking by 1
          LDBA    NL,d            ; print a new line to create a new row
          STBA    charOut,d
          BR      excess_p        ; check if there are more positive numbers to print
pdone:    NOP0                    
          ;-----------------------------------------------------------
          STOP
          .END