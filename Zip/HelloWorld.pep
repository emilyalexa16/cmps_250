;P.M.J. (Spring 2018)
;A program to output "Hello World"
;
main:    STRO       message,d
         STOP  
message: .ASCII     "Hello World\n\x00"
        .END   
