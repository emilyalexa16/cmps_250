;P.M.J. (Spring 2018)
;Emily Alexa Gotiangco (Spring 2024)
;A program to compute and print Tribonacci Numbers
;   
         BR         main
message: .ASCII     "The Tribonacci Numbers are ..."
         .BYTE      0x00
NL:      .ASCII     "\n\x00" 
term1:   .WORD      1
term2:   .WORD      1
term3:   .WORD      2
nextt:   .BLOCK     2
main:    STRO       message,d
         STRO       NL,d
         DECO       term1,d
         STRO       NL,d
         DECO       term2,d
         STRO       NL,d
         DECO       term3,d
         STRO       NL,d
loop:    LDWA       term1,d
         ADDA       term2,d
         ADDA       term3,d
         BRV        done
         STWA       nextt,d
         DECO       nextt,d
         STRO       NL,d
         LDWA       term2,d
         STWA       term1,d       ;term1 = term2
         LDWA       term3,d
         STWA       term2,d       ;term2 = term3
         LDWA       nextt,d
         STWA       term3,d       ;term3 = next
         BR         loop
done:    LDBA       '!',i
         STBA       charOut,d
         STOP  
        .END   
