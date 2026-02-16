           BR      main      ;Branch around data
num:       .BLOCK  2         ;Storage for one integer
main:      DECI    num,d     ;Get the number
           DECO    num,d     ;And Output it
           STRO    msg,d     ;Output " + 1 = "
           LDWA    num,d     ;A <= the number
           ADDA    1,i       ;Add one to it
           STWA    num,d     ;Store the sum
           DECO    num,d     ;Output the sum
           STOP
msg:       .ASCII  " + 1 = \x00"
           .END
