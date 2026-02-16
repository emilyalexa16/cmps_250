;The "Mean" Program with "divisor subprogram"
; CMPS 250 - Spring 2017
; P.M.J.
;
          BR        main
;----------------------------------------------------------------------
; String declarations
;----------------------------------------------------------------------
tmsg:     .ASCII    "Total is \x00"
cmsg:     .ASCII    "Count is \x00"
mmsg:     .ASCII    "Mean is \x00"
mundef:   .ASCII    "undefined!!!\x00"
nlmsg:    .ASCII    "\n\x00"
;----------------------------------------------------------------------
; Variables
;----------------------------------------------------------------------
value:    .BLOCK    2
total:    .BLOCK    2
count:    .BLOCK    2
quotient: .BLOCK    2
;----------------------------------------------------------------------
main:     NOP0
          ;------------------------------------------------------------
          ; Loop to read and accumulate integer input values
          ;------------------------------------------------------------
loop:     DECI      value,d
          LDWA      value,d
          CPWA      0,i
          BREQ      done
          LDWA      total,d     ;+ total = total + value;
          ADDA      value,d     ;|
          STWA      total,d     ;+
          LDWA      count,d     ;+ count = count + 1;
          ADDA      1,i         ;|
          STWA      count,d     ;+
          BR        loop
done:     NOP0
          ;------------------------------------------------------------
          ; Report the total and count
          ;------------------------------------------------------------
          STRO      tmsg,d
          DECO      total,d
          STRO      nlmsg,d
          STRO      cmsg,d
          DECO      count,d
          STRO      nlmsg,d
          ;------------------------------------------------------------
          ; Report the mean
          ;------------------------------------------------------------
          STRO      mmsg,d
          LDWA      count,d
          BREQ      none
          ;------------------------------------------------------------
          ; Determine the mean using the division subprogram
          ;------------------------------------------------------------
          STWA      -2,s
          LDWA      total,d
          STWA      -4,s
          SUBSP     4,i
          CALL      divide
          ADDSP     4,i
          STWA      quotient,d
          ;------------------------------------------------------------
report:   DECO      quotient,d
          BR        nl
none:     STRO      mundef,d
nl:       STRO      nlmsg,d
          STOP
;----------------------------------------------------------------------
; int quotient(int dividend, int divisor) ;
;----------------------------------------------------------------------
dividend: .EQUATE  2
divisor:  .EQUATE  4
;----------------------------------------------------------------------
divide:   NOP0
          LDWA     0,i
          LDWX     dividend,s
lloop:    CPWX     divisor,s 
          BRLT     ldone
          SUBX     divisor,s
          ADDA     1,i
          BR       lloop
ldone:    RET 
          .END
