;PMJ's MPP ver2012.0 ...
; Student Name: Emily Alexa Gotiangco
           BR        main
;-----------------------------------------------------------------------
CAPACITY:  .WORD     24
actual:    .BLOCK    2
;-----------------------------------------------------------------------
; What immediately follows is the "array of strings"
; 24 strings, each with a capacity of 15 characters
;-----------------------------------------------------------------------
           .BYTE     15                                             ;The "before byte" descriptor
array:     .BLOCK    15                                             ;The reserved space for the string
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
           .BYTE     15
           .BLOCK    15
;-----------------------------------------------------------------------
;
;{ PEP2.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;-------------------------------------------------------------------
; Global "low memory" locations used for temporary static storage
;.GLOBAL    TEMP
TEMP:      .BLOCK    4
;.GLOBAL    JUNK
JUNK:      .BLOCK    2
;.GLOBAL    SAVED
SAVED:     .BLOCK    2
;.GLOBAL    SAVEA
SAVEA:     .BLOCK    2                                              ;where A is saved statically
;.GLOBAL    SAVEX
SAVEX:     .BLOCK    2                                              ;where X is saved statically
;.GLOBAL    SAVEPP
SAVEPP:    .BLOCK    2
;============================================================
;============================================================
;============================================================
;============================================================
;} PEP2.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;-----------------------------------------------------------------------
title:     .ASCII    "PMJ's SSorting ...\n\x00"
prompt:    .ASCII    "Enter a string:\x00"
mActual:   .ASCII    " strings read and stored\n\x00"
mOrdered:  .ASCII    "The sorted strings are:\n\x00"
mDONE:     .ASCII    "DONE!!!\n\x00"
;-----------------------------------------------------------------------
main:      STRO      title,d
;;;;;;;;;; PUSH      CAPACITY,d                                     ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      CAPACITY,d                                     ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
;;;;;;;;;; PUSH      array,i                                        ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      array,i                                        ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
           CALL      strgRead
           ADDSP     4,i
           STWA      actual,d
;----------
           DECO      actual,d
           STRO      mActual,d
;----------
;print1:;; PUSH      actual,d                                       ;
print1:    NOP0                                                     ;< PUSH >
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      actual,d                                       ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
;;;;;;;;;; PUSH      array,i                                        ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      array,i                                        ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
           CALL      strgPrnt
           ADDSP     4,i
;----------
;sort:;;;; PUSH      actual,d                                       ;
sort:      NOP0                                                     ;< PUSH >
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      actual,d                                       ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
;;;;;;;;;; PUSH      array,i                                        ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      array,i                                        ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
           CALL      strgSort
           ADDSP     4,i
;----------
;print2:;; PUSH      actual,d                                       ;
print2:    NOP0                                                     ;< PUSH >
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      actual,d                                       ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
;;;;;;;;;; PUSH      array,i                                        ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      array,i                                        ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
           CALL      strgPrnt
           ADDSP     4,i
;----------
           STRO      mDONE,d
           STOP
           BR        STOPEND
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;
;{ STRInput.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  STRInput
STRInput:  NOP0
;;;;;;;;;; SAVEX                                                    ;
           STWX      SAVEX,d                                        ;< SAVEX >
Sobject:   .EQUATE   6
capacity:  .EQUATE   0
ignored:   .EQUATE   2
           SUBSP     4,i
           LDWA      0,i
           STWA      ignored,s
           LDWX      -1,i
           LDWA      0,i
           LDBA      Sobject,sfx
           STWA      capacity,s
           LDWX      0,i
           CPWX      capacity,s
           BRGE      error
           LDWA      0,i
loop:      CPWX      capacity,s
           BREQ      full
           LDBA      charIn,d
           STBA      Sobject,sfx
           LDBA      Sobject,sfx
           CPWA      '\n',i
           BREQ      done
           ADDX      1,i
           BR        loop
full:      LDWA      ignored,s
           ADDA      1,i
           STWA      ignored,s
           SUBX      1,i
ignore:    LDBA      charIn,d
           STBA      Sobject,sfx
           LDWA      0,i
           LDBA      Sobject,sfx
           CPWA      '\n',i
           BREQ      done
           LDWA      ignored,s
           ADDA      1,i
           STWA      ignored,s
           BR        ignore
done:      LDBA      0,i
           STBA      Sobject,sfx
           LDWA      ignored,s
           BR        return
error:     LDWA      -1,i
return:    ADDSP     4,i                                            ;
;;;;;;;;;; RESTOREX                                                 ;
           LDWX      SAVEX,d                                        ;< RESTOREX >
           RET                                                      ;
;} STRInput.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ BINOutpt.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  BINOutpt
m:         .EQUATE   4
BINOutpt:  NOP0
           SUBSP     0,i
           STWA      SAVED,d
           LDWA      0,i
           STWA      -2,s
           SUBSP     2,i
           LDWA      SAVED,d
           STWA      SAVEA,d
           STWX      SAVEX,d
           LDWA      m,s
           LDWX      16,i
BINOloop:  NOP0
           CPWX      0,i
           BREQ      BINOdone
           ROLA
           BRC       BINO1
BINO0:     STWA      -2,s
           LDBA      '0',i
           STBA      charOut,d
           BR        BINOnext
BINO1:     STWA      -2,s
           LDBA      '1',i
           STBA      charOut,d
BINOnext:  LDWA      -2,s
           SUBX      1,i
           BR        BINOloop
BINOdone:  NOP0
           LDWX      SAVEX,d
           LDWA      SAVEA,d
           ADDSP     0,s
           ADDSP     2,i
           RET
;} BINOutpt.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ DUMPS.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  DumpS
Acopy:     .BLOCK    2
Xcopy:     .BLOCK    2
display:   .BLOCK    2
LL0:       .BLOCK    2
dmsg:      .ASCII    "------------------------------- DUMPS\n\x00"
cmsg:      .ASCII    ",\x00"
amsg:      .ASCII    "(A=\x00"
xmsg:      .ASCII    "(X=\x00"
dlmsg:     .ASCII    ": \x00"
DumpSN:    .EQUATE   2
DumpS:     NOP0
           STWA      Acopy,d
           STWX      Xcopy,d
           STRO      dmsg,d
           STWA      LL0,d
           STRO      amsg,d
           HEXO      LL0,d
           STRO      cmsg,d
           DECO      LL0,d
           LDBA      ')',i
           STBA      charOut,d
           STRO      cmsg,d
           STWX      LL0,d
           STRO      xmsg,d
           HEXO      LL0,d
           STRO      cmsg,d
           DECO      LL0,d
           LDBA      ')',i
           STBA      charOut,d
           LDBA      '\n',i
           STBA      charOut,d
           LDWX      DumpSN,s
           MOVSPA
           ADDA      4,i
           STWA      LL0,d
DumpLoop:  CPWX      0,i
           BRLE      DumpDone
           HEXO      LL0,d
           STRO      dlmsg,d
           LDWA      LL0,n
           STWA      display,d
           HEXO      display,d
           STRO      cmsg,d
           DECO      display,d
           LDBA      '\n',i
           STBA      charOut,d
           LDWA      LL0,d
           ADDA      2,i
           STWA      LL0,d
           SUBX      2,i
           BR        DumpLoop
DumpDone:  LDWX      Xcopy,d
           LDWA      Acopy,d
           RET
;} DUMPS.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ Strings.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;************************************************************************
;File:   Strings.pep2
;
; A Collection of subprograms providing operations on strings.  Each of
; these subprograms makes use of a "pseudo String object", which is a
; representation consisting of n+1 contiguous bytes with the first byte
; containing the size of the container (which would be n).  This "object"
; is referenced using the address of the second byte.
;Author: P.M.J.
;Date:   Spring 2017
;************************************************************************
;
;} Strings.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ strgRead.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;strgRead.pep2
;/* Functional subprogram that returns the count of the number of non-empty
;   strings which have been read and stored in the leading elements of the given
;   array of strings.  Note that the given limit provides the capacity of the
;   array so that memory overflow does not occur.  However, each string in the
;   array must be a String Object that occupies 16 bytes (including the before
;   byte descriptor).
;*/
;.GLOBAL  strgRead
;-----------------------------------------------------------
; int strgRead(char *string[], int limit);
;-----------------------------------------------------------
string:    .EQUATE   2
limit:     .EQUATE   4
;-----------------------------------------------------------
LL1:       .ASCII    "Enter:\x00"
mTrunc:    .ASCII    "--->input truncated!\n\x00"
;-----------------------------------------------------------
           .BYTE     15
line:      .BLOCK    16
address:   .ADDRSS   line
index:     .BLOCK    2
;-----------------------------------------------------------
strgRead:  NOP0
;;;;;;;;;; CLRWX                                                    ; X = 0; ;
           LDWX      0,i                                            ;< CLRWX >
LL2:       CPWX      limit,s
           BRGE      LL3
           STRO      LL1,d
;;;;;;;;;; STRI      address,d                                      ;
;;;;;;;;;; PUSH      address,d                                      ;< STRI >
           STWA      SAVEPP,d                                       ;< PUSH,STRI >
           LDWA      address,d                                      ;< PUSH,STRI >
;;;;;;;;;; PUSHA                                                    ;< PUSH,STRI >
           STWA      -2,s                                           ;< PUSHA,PUSH,STRI >
           SUBSP     2,i                                            ;< PUSHA,PUSH,STRI >
           LDWA      SAVEPP,d                                       ;< PUSH,STRI >
           CALL      STRInput                                       ;< STRI >
           ADDSP     2,i                                            ;< STRI >
;;;;;;;;;; TSTWA                                                    ;
           CPWA      0,i                                            ;< TSTWA >
           BREQ      gotAll
           STRO      mTrunc,d
;----------
gotAll:    NOP0
;;;;;;;;;; PUSH      address,d                                      ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      address,d                                      ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
           CALL      Slength
           ADDSP     2,i
;;;;;;;;;; TSTWA                                                    ;
           CPWA      0,i                                            ;< TSTWA >
           BREQ      LL3
;----------
           STWX      index,d
           ASLX
           ASLX
           ASLX
           ASLX
           ADDX      string,s
;;;;;;;;;; PUSHX                                                    ;
           STWX      -2,s                                           ;< PUSHX >
           SUBSP     2,i                                            ;< PUSHX >
;;;;;;;;;; PUSH      address,d                                      ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      address,d                                      ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
           CALL      Scopy
           ADDSP     4,i
           LDWX      index,d
;----------
;;;;;;;;;; INCX                                                     ;
           ADDX      1,i                                            ;< INCX >
           BR        LL2
;----------
LL3:       STWX      -2,s                                           ;+ A = X;
           LDWA      -2,s                                           ;+
LL4:       RET
;} strgRead.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ strgPrnt.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; Student Name: Emily Alexa Gotiangco
;strgPrnt.pep2
;/* Subprogram that produces a printout of the LL5 values stored in the leading
;   elements of the given array of strings (as indicated by the value of n), one
;   per line.
;*/
;.GLOBAL  strgPrnt
;-----------------------------------------------------------
; void strgPrnt(char *string[], int N);
;-----------------------------------------------------------
LL5:       .EQUATE   2
N:         .EQUATE   4
;-----------------------------------------------------------
LL6:       .BLOCK    2
LL7:       .BLOCK    2
prefix:    .ASCII    ": \"\x00"
suffix:    .ASCII    "\"\n\x00"
;-----------------------------------------------------------
strgPrnt:  NOP0
;----------
           LDWX      0,i
           STWX      LL7,d
LL8:       LDWX      LL7,d
           CPWX      N,s
           BREQ      LL9
           ASLX
           ASLX
           ASLX
           ASLX
           ADDX      LL5,s
           STWX      LL6,d
           DECO      LL7,d
           STRO      prefix,d
           STRO      LL6,n
           STRO      suffix,d
           LDWX      LL7,d
;;;;;;;;;; INCX                                                     ;
           ADDX      1,i                                            ;< INCX >
           STWX      LL7,d
           BR        LL8
;----------
LL9:       RET
;} strgPrnt.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ strgSort.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; Student Name: Emily Alexa Gotiangco
; strgSort.pep2
; Subprogram that reorders the LL10 values stored in the leading elements of
; the given array of strings (as indicated by the value of n), so that they are
; now in ascending lexicographic order.
;.GLOBAL  strgSort
;-----------------------------------------------------------
; void strgSort(char *string[], int N);
;-----------------------------------------------------------
LL10:      .EQUATE   2
LL11:      .EQUATE   4
;-----------------------------------------------------------
LL12:      .BLOCK    2
LL13:      .BLOCK    2
temp:      .BLOCK    16
;------------------------------------------------------------
message:   .ASCII    "Begin sorting: \n\x00"
;------------------------------------------------------------
strgSort:  NOP0
           STRO      message,d
           LDWA      LL11,s
           SUBA      1,i
           STWA      LL11,s
reset:     LDWX      0,i
           STWX      LL13,d
LL14:      LDWX      LL13,d
           CPWX      LL11,s
           BREQ      LL15
           ASLX
           ASLX
           ASLX
           ASLX
           ADDX      LL10,s
           STWX      LL12,d
;;;;;;;;;; PUSH      LL12,d                                         ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      LL12,d                                         ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
           ADDX      16,i
           STWX      LL12,d
;;;;;;;;;; PUSH      LL12,d                                         ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      LL12,d                                         ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
           CALL      ScompTo
           ADDSP     4,i
           CPWA      0,i
           BRGT      noChng
;;;;;;;;;; PUSH      temp,i                                         ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      temp,i                                         ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
;;;;;;;;;; PUSH      LL12,d                                         ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      LL12,d                                         ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
           CALL      Scopy
           ADDSP     4,i
;;;;;;;;;; PUSH      LL12,d                                         ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      LL12,d                                         ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
           SUBX      16,i
           STWX      LL12,d
;;;;;;;;;; PUSH      LL12,d                                         ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      LL12,d                                         ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
           CALL      Scopy
           ADDSP     4,i
;;;;;;;;;; PUSH      LL12,d                                         ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      LL12,d                                         ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
;;;;;;;;;; PUSH      temp,i                                         ;
           STWA      SAVEPP,d                                       ;< PUSH >
           LDWA      temp,i                                         ;< PUSH >
;;;;;;;;;; PUSHA                                                    ;< PUSH >
           STWA      -2,s                                           ;< PUSHA,PUSH >
           SUBSP     2,i                                            ;< PUSHA,PUSH >
           LDWA      SAVEPP,d                                       ;< PUSH >
           CALL      Scopy
           ADDSP     4,i
           BR        reset
noChng:    LDWX      LL13,d
;;;;;;;;;; INCX                                                     ;
           ADDX      1,i                                            ;< INCX >
           STWX      LL13,d
           BR        LL14
;----------
LL15:      RET
;} strgSort.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ Slength.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;Slength.pep2
;
; A functional subprogram that returns the length of the given
; string.  This is LL18 by scanning for the terminating null char.
;
;.GLOBAL   Slength
;-----------------------------------------------------------
; int Slength(char string[]);
;-----------------------------------------------------------
LL16:      .EQUATE   2
;-----------------------------------------------------------
NC:        .ASCII    "\x00"                                         ;the "null char"
;-----------------------------------------------------------
;Slength:; SAVEX                                                    ;
Slength:   NOP0                                                     ;< SAVEX >
           STWX      SAVEX,d                                        ;< SAVEX >
;;;;;;;;;; CLRWX                                                    ;  X = 0; ;
           LDWX      0,i                                            ;< CLRWX >
LL17:      LDBA      LL16,sfx                                       ;+ while(string[X] != NC) {
           CPBA      NC,d                                           ;|
           BREQ      LL18                                           ;|
;;;;;;;;;; INCX                                                     ;|   X = X + 1; ;
           ADDX      1,i                                            ;< INCX >
           BR        LL17                                           ;+ }
;----------
LL18:      STWX      -2,s                                           ;+ A = X;
           LDWA      -2,s                                           ;+
;return:;; RESTOREX                                                 ;
LL19:      NOP0                                                     ;< RESTOREX >
           LDWX      SAVEX,d                                        ;< RESTOREX >
           RET
;} Slength.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ Scapcity.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;Scapcity.pep2
;
; A functional subprogram that returns the capacity of the given string.
; Essentially, it returns the value of the "before byte".
;
;.GLOBAL   Scapcity
;-----------------------------------------------------------
; int Scapcity(char string[]);
;-----------------------------------------------------------
LL20:      .EQUATE   2
;-----------------------------------------------------------
;-----------------------------------------------------------
;Scapcity: SAVEX                                                    ;
Scapcity:  NOP0                                                     ;< SAVEX >
           STWX      SAVEX,d                                        ;< SAVEX >
;----------
           LDWX      -1,i                                           ; A = string[-1];
           LDWA      0,i
           LDBA      LL20,sfx                                       ;
;----------
;;;;;;;;;; RESTOREX                                                 ;
           LDWX      SAVEX,d                                        ;< RESTOREX >
           RET
;} Scapcity.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ Scopy.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;Scopy.pep2
;
;
;
;.GLOBAL   Scopy
;-----------------------------------------------------------
; int Scopy(char source[], char destin[]);
;-----------------------------------------------------------
source:    .EQUATE   2
destin:    .EQUATE   4
;-----------------------------------------------------------
LL21:      .ASCII    "\x00"
;-----------------------------------------------------------
;Scopy:;;; SAVEX                                                    ;
Scopy:     NOP0                                                     ;< SAVEX >
           STWX      SAVEX,d                                        ;< SAVEX >
;;;;;;;;;; CLRWX                                                    ;  X = 0; ;
           LDWX      0,i                                            ;< CLRWX >
LL22:      LDBA      source,sfx                                     ;+ while(source[X] != NC) {
           CPBA      LL21,d                                         ;|
           BREQ      LL23                                           ;|
           STBA      destin,sfx                                     ;|   destin[X] = source[X];
;;;;;;;;;; INCX                                                     ;|   X = X + 1; ;
           ADDX      1,i                                            ;< INCX >
           BR        LL22                                           ;+ }
;--------
LL23:      STBA      destin,sfx                                     ;  destin[X] = source[X];
           STWX      -2,s
           LDWA      -2,s
;;;;;;;;;; RESTOREX                                                 ;
           LDWX      SAVEX,d                                        ;< RESTOREX >
           RET
;} Scopy.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ ScompTo.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;************************************************************************
; String comparision subprogram that compares two strings (Sobjects) and
; returns a number less than zero if the first object is lexiographicall
; before (i.e. less than) the second, zero if they are equivalent, and a
; positive number otherwise.
;
;********  int ScompTo (char[] Sobject1, char[] Sobject2)
;
;-- Arguments -----------------------------------------------------------
Sobject1:  .EQUATE   2                                              ;formal parameter; address of Sobject
Sobject2:  .EQUATE   4                                              ;formal parameter; address of Sobject
;-- Local Data ----------------------------------------------------------
hold2:     .BLOCK    2
COMMA:     .ASCII    ",\x00"
NL:        .ASCII    "\n\x00"
;-- Entry Point ---------------------------------------------------------
;.GLOBAL   ScompTo
;ScompTo:; SAVEX                                                    ;
ScompTo:   NOP0                                                     ;< SAVEX >
           STWX      SAVEX,d                                        ;< SAVEX >
;;;;;;;;;; CLRWA                                                    ;  A = 0; ;
           LDWA      0,i                                            ;< CLRWA >
;;;;;;;;;; CLRWX                                                    ;  X = 0; ;
           LDWX      0,i                                            ;< CLRWX >
LL24:      NOP0                                                     ;+ LL24 {
           LDBA      Sobject2,sfx                                   ;| + if(Sobject2[X] == 0x00) {
;;;;;;;;;; TSTWA                                                    ;| |   EXIT pos; ;
           CPWA      0,i                                            ;< TSTWA >
           BREQ      pos                                            ;| + }
           STWA      hold2,d                                        ;|   hold2 = Sobject2[X];
           LDBA      Sobject1,sfx                                   ;| + if(Sobject1[X] == 0x00) {
;;;;;;;;;; TSTWA                                                    ;| |   EXIT makeneg; ;
           CPWA      0,i                                            ;< TSTWA >
           BREQ      makeneg                                        ;| + }
           CPWA      hold2,d                                        ;| + if(Sobject1[X] ? hold2) {
           BRLT      makeneg                                        ;| |   WHEN < EXIT makeneg;
           BRGT      makepos                                        ;| |   WHEN > EXIT makepos;
           NOP0                                                     ;| + }
;;;;;;;;;; INCX                                                     ;|   X = X + 1; ;
           ADDX      1,i                                            ;< INCX >
           BR        LL24                                           ;+ }
;---------
makeneg:   LDWA      -1,i
           BR        LL25
;---------
pos:       LDBA      Sobject1,sfx
;;;;;;;;;; TSTWA                                                    ;
           CPWA      0,i                                            ;< TSTWA >
           BREQ      makezero
makepos:   LDWA      1,i
           BR        LL25
;---------
;makezero: CLRWA                                                    ;
makezero:  NOP0                                                     ;< CLRWA >
           LDWA      0,i                                            ;< CLRWA >
;---------
;done:;;;; RESTOREX                                                 ;
LL25:      NOP0                                                     ;< RESTOREX >
           LDWX      SAVEX,d                                        ;< RESTOREX >
           RET                                                      ;
;} ScompTo.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
STOPEND:   STOP
           .END
;Resolver Report:
; actual --> LL0
; prompt --> LL1
; loop --> LL2
; done --> LL3
; return --> LL4
; string --> LL5
; address --> LL6
; index --> LL7
; loop --> LL8
; done --> LL9
; string --> LL10
; N --> LL11
; address --> LL12
; index --> LL13
; loop --> LL14
; done --> LL15
; string --> LL16
; loop --> LL17
; done --> LL18
; return --> LL19
; string --> LL20
; NC --> LL21
; loop --> LL22
; done --> LL23
; loop --> LL24
; done --> LL25
