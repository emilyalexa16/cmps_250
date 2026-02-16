;P.M.J. (Spring 2018)
;A program to determine the max interger value read in a sequence of zero terminated values
;   
         BR         main
message: .ASCII     " is the max.\n"
         .BYTE      0x00
SENTINEL:.EQUATE    0
value:  .BLOCK      2
max:    .BLOCK      2
main:    LDWA       SENTINEL,i
         STWA       max,d
loop:    DECI       value,d
         LWDA       value,d
         CPWA       SENTINEL,i
         BREQ       done
         LDWA       max,d
         CPWA       SENTINEL,i
         BREQ       update
         CPWA       value,d
         BRGE       next
update:  LDWA       value,d
         STWA       max,d
next:    BR         loop
;
done:    DECO       max,d
         STRO       message,d
         STOP  
        .END   
