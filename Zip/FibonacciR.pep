;P.M.J. (Spring 2018)
;A program to compute and print Fibonacci Numbers
;   
         BR         main
message: .ASCII     "The Fibonacci Numbers are ..."
         .BYTE      0x00
NL:      .ASCII     "\n"
         .BYTE      0x00 
term1:   .WORD      1       ; int term1 = 1;
term2:   .WORD      1       ; int term2 = 1;
nextt:   .BLOCK     2
main:    STRO       message,d
         STRO       NL,d
         DECO       term1,d
         STRO       NL,d
         DECO       term2,d
         STRO       NL,d
loop:    NOP0                 ;  do {
         LDWA       term1,d   ;  |  next = term1 + term2;
         ADDA       term2,d   ;  |
         BRV        done
         STWA       nextt,d
         DECO       nextt,d
         STRO       NL,d
         LDWA       term2,d   ;  |  term1 = term2;
         STWA       term1,d   ;
         LDWA       nextt,d   ;  |  term2 = next; 
         STWA       term2,d   ;
next:    BR         loop      ;  }
done:    LDBA       '!',i
         STBA       charOut,d
         STOP  
        .END   
