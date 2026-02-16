;The "Mean" Program
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
          ; Determine the mean using repeated subtraction
          ;------------------------------------------------------------
          LDWA      0,i
          STWA      quotient,d
more:     LDWA      total,d
          CPWA      count,d
          BRLT      report
          LDWA      total,d        ;+ total = total - count;
          SUBA      count,d        ;|
          STWA      total,d        ;+
          LDWA      quotient,d     ;+ quotient = quotient + 1;
          ADDA      1,i            ;|
          STWA      quotient,d     ;+
          BR        more
report:   DECO      quotient,d
          BR        nl
none:     STRO      mundef,d
nl:       STRO      nlmsg,d
          STOP
          .END
