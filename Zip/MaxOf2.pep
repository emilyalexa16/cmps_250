;P.M.J. (Spring 2018)
;A program to determine the max of two numbers input
;   
         BR         main
message: .ASCII     " is the max of the two.\n"
         .BYTE      0x00
value1:  .BLOCK     2
value2:  .BLOCK     2
main:    DECI       value1,d
         DECI       value2,d
         LDWA       value1,d
         CPWA       value2,d
         BRLT       two 
one:     DECO       value1,d
         BR         done
two:     DECO       value2,d
done:    STRO       message,d
         STOP  
        .END   
