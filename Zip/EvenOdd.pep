;File: EvenOdd.pep
;P.M.J.
;Spring 2018
;
       BR      main
;*******************************************************************
n:     .BLOCK  2
Even:  .ASCII  "Even\n"
       .BYTE   0
Odd:   .ASCII  "Odd\n"
       .BYTE  0 
;********************************************************************

;******* main () ****************************************************
main:  NOP0
Loop:  DECI    n,d           ;
       LDWA    n,d           ;
       CPWA    0,i 
       BREQ    Done 
       ASRA                  ; shift to the right
       BRC     Do1           ; branch if the carry is set 

Do0:   STRO    Even,d
       BR      Next
Do1:   STRO    Odd,d
       BR      Next
Next:  BR      Loop
Done:  STOP
;********************************************************************
       .END